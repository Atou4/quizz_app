import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/animations/empty_animation.dart';
import 'package:quizz_app/views/animations/loading_animation.dart';
import 'package:quizz_app/views/client/home/components/quizes/quiz_widget.dart';

import '../../../../../controllers/quiz/quiz_model_controller.dart';
import '../../../../../widgets/animations/animated_in_effect.dart';
import '../../../../animations/error_animation.dart';

final categorynameprovider = StateProvider<String>((ref) {
  return "Travel";
});

class QuizesList extends ConsumerWidget {
  final String categoryname;
  final bool admin;
  const QuizesList({Key? key, required this.categoryname, required this.admin})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(QuizListProvider);

    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: quizList.when(
            data: (data) => data.isEmpty
                ? EmptyContentsAnimationView()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: quizList.value!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final quiz = quizList.value!.elementAt(index);
                      return AnimateInEffect(
                          keepAlive: true,
                          intervalStart: index / quizList.value!.length,
                          child: QuizItem(
                            quiz: quiz,
                            admin: admin,
                          ));
                    },
                  ),
            error: (error, _) => ErrorAnimationView(),
            loading: () => LoadingAnimationView()));
  }
}
