import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/common_widgets/animations/animations/empty_animation.dart';
import 'package:quizz_app/common_widgets/animations/animations/loading_animation.dart';
import '../../../../../admin_app/add_delete_quiz/controllers/quizlist_stream.dart';
import '../../../../../../common_widgets/animations/animated_in_effect.dart';
import '../../../../../../common_widgets/animations/animations/error_animation.dart';
import 'quiz_widget.dart';

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
            data: (data) {
              if (data.isEmpty){
                return EmptyContentsAnimationView();
              }
              else{
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
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
                  );
              }
            },
            error: (error, _) =>  const ErrorAnimationView(),
            loading: () => const LoadingAnimationView()));
  }
}
