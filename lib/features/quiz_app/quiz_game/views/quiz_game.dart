import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/features/quiz_app/quiz_game/models/quiz_model.dart';
import 'package:quizz_app/common_widgets/animations/animations/error_animation.dart';
import 'package:quizz_app/features/quiz_app/quiz_game/views/quiz_questions.dart';
import 'package:quizz_app/features/quiz_app/quiz_game/views/quiz_results.dart';
import 'package:quizz_app/common_widgets/animated_button.dart';

import '../controllers/quiz_game_controller.dart';
import '../controllers/quiz_state.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/constants.dart';

class QuizGameScreen extends HookConsumerWidget {
  final QuizModel quiz;
  const QuizGameScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    if (quiz.question.isEmpty) return ErrorAnimationView();

    final quizState = ref.watch(quizControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
        body: quizState.status == QuizStatus.complete
            ? QuizResults(state: quizState, questions: quiz.question)
            : QuizQuestions(
                pageController: pageController,
                state: quizState,
                questions: quiz.question,
              ),
        bottomSheet: (!quizState.answered)
            ? const SizedBox.shrink()
            : Padding(
              padding:EdgeInsets.symmetric(horizontal: defaultPadding*4,vertical: defaultPadding),
              child: AnimatedButton(
                  isValidated: false,
                  text: pageController.page!.toInt() + 1 < quiz.question.length
                      ? 'Next Question'
                      : 'See Results',
                  onPressed: () {
                    ref.read(quizControllerProvider.notifier).nextQuestion(
                        quiz.question, pageController.page!.toInt());
                    if (pageController.page!.toInt() + 1 < quiz.question.length) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear,
                      );
                    }
                  }, color: AppColors.blue,
                ),
            ));
  }
}
