import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/animations/empty_animation.dart';
import 'package:quizz_app/views/animations/go_animation.dart';

import '../../../controllers/quiz/quiz_gaem_controller.dart';
import '../../../controllers/quiz/quiz_state.dart';
import '../../../models/question_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/card_answer.dart';

class QuizQuestions extends HookConsumerWidget {
  final PageController pageController;
  final QuizState state;
  final List<QuestionModel?> questions;
  const QuizQuestions(
      {super.key,
      required this.state,
      required this.questions,
      required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final showMain =useState(false) ;

    Future.delayed(Duration(seconds: 3)).then((_) {
      showMain.value = true;
   } );
    return showMain.value?
    PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height / 3.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding, right: defaultPadding, top: 60), 
                  child: Text(
                    'Question ${index + 1} ',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.only(
                      left: defaultPadding, right: defaultPadding, top: 120),
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const SizedBox(height: defaultPadding),
                    Text(
                      question!.question.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: defaultPadding),
                    AnswerCard(
                        answer: question.incorrrectanswer![0].toString(),
                        isSelected: question.incorrrectanswer![0].toString() ==
                            state.selectedAnswer,
                        isCorrect: question.incorrrectanswer![0].toString() ==
                            question.correctanswer,
                        isDisplayingAnswer: state.answered,
                        onTap: () {
                          ref
                              .read(quizControllerProvider.notifier)
                              .submitAnswer(question,
                                  question.incorrrectanswer![0].toString());
                        }),
                    AnswerCard(
                      answer: question.incorrrectanswer![1].toString(),
                      isSelected: question.incorrrectanswer![1].toString() ==
                          state.selectedAnswer,
                      isCorrect: question.incorrrectanswer![1].toString() ==
                          question.correctanswer,
                      isDisplayingAnswer: state.answered,
                      onTap: () => ref
                          .read(quizControllerProvider.notifier)
                          .submitAnswer(question,
                              question.incorrrectanswer![1].toString()),
                    ),
                    AnswerCard(
                      answer: question.correctanswer.toString(),
                      isSelected: question.correctanswer.toString() ==
                          state.selectedAnswer,
                      isCorrect: question.correctanswer.toString() ==
                          question.correctanswer,
                      isDisplayingAnswer: state.answered,
                      onTap: () => ref
                          .read(quizControllerProvider.notifier)
                          .submitAnswer(
                              question, question.correctanswer.toString()),
                    ),
                    AnswerCard(
                      answer: question.incorrrectanswer![2].toString(),
                      isSelected: question.incorrrectanswer![2].toString() ==
                          state.selectedAnswer,
                      isCorrect: question.incorrrectanswer![2].toString() ==
                          question.correctanswer,
                      isDisplayingAnswer: state.answered,
                      onTap: () => ref
                          .read(quizControllerProvider.notifier)
                          .submitAnswer(question,
                              question.incorrrectanswer![2].toString()),
                    ),
                  ]),
                ),
                
              ],
            ),
          ],
        );
      },
    )
    :Center(child: goAnimationView());
    
  }
}
