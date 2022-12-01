import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/extensions/firebase/firebase_firestore_extension.dart';
import 'package:quizz_app/general_providers.dart';

import '../../models/quiz_model.dart';
import '../../views/client/home/components/quizes/quiz_list.dart';

final QuizListProvider = StreamProvider.autoDispose<Iterable<QuizModel>>((ref) {
  final controller = StreamController<Iterable<QuizModel>>();
  //late Stream<List<QuizModel>> stream;
  final snap =
           ref.read(firebaseFirestoreProvider).quizListRef().where("category",isEqualTo: ref.read(categorynameprovider.notifier).state).snapshots().listen(
      (snapshots) {
        
        final posts = snapshots.docs.map(
          (doc) => QuizModel.fromDocument(doc)
        );
        controller.sink.add(posts);
      },
    );

 /* final snap = ref
      .read(firebaseFirestoreProvider)
      .quizListRef()
      .where("category",
          isEqualTo: ref.read(categorynameprovider.notifier).state)
      .snapshots();

  stream = snap.map((snapshot) {
      final result = snapshot.docs
          .map((doc) => QuizModel.fromDocument(doc))
          .toList();
      return result;
    });*/
  

  ref.onDispose(() {
    snap.cancel();
      controller.close();
  });

  return controller.stream;
});
