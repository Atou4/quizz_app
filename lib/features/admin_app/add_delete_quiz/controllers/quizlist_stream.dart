import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/extensions/firebase/firebase_firestore_extension.dart';
import 'package:quizz_app/providers/general_providers.dart';

import '../../../quiz_app/quiz_game/models/quiz_model.dart';
import '../../../quiz_app/home_view/views/components/quizes/quiz_list.dart';

final QuizListProvider = StreamProvider.autoDispose<Iterable<QuizModel>>((ref) {
  final controller = StreamController<Iterable<QuizModel>>();
  final snap =
           ref.read(firebaseFirestoreProvider).quizListRef().where("category",isEqualTo: ref.read(categorynameprovider.notifier).state).snapshots().listen(
      (snapshots) {
        
        final posts = snapshots.docs.map(
          (doc) => QuizModel.fromDocument(doc)
        );
        controller.sink.add(posts);
      },
    );

  

  ref.onDispose(() {
    snap.cancel();
      controller.close();
  });

  return controller.stream;
});
