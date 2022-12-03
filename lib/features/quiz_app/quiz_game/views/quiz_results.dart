import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';
import 'package:quizz_app/common_widgets/animated_button.dart';

import '../controllers/quiz_game_controller.dart';
import '../controllers/quiz_state.dart';
import '../models/question_model.dart';
import '../repositories/quiz_repository.dart';
import '../../../../utils/constants.dart';
import '../../bottomnav_bar.dart';

class QuizResults extends ConsumerWidget {
  final QuizState? state;
  final List<QuestionModel?> questions;
  const QuizResults({super.key, required this.state, required this.questions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        children: [
          Center(
            child: 
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
                  children: [
                    Text(
                      '${state!.correct.length} / ${questions.length}',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'CORRECT',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: defaultPadding ),
                    AnimatedButton(
                      color:  AppColors.blue,
                      onPressed: () {
                        ref.refresh(quizRepositoryProvider);
                        ref.read(quizControllerProvider.notifier).reset();
                      },
                      isValidated: false,
                      text: 'New Quiz',
                    ),
                    const SizedBox(height: defaultPadding ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 4,
                          vertical: defaultPadding),
                      child: AnimatedButton(
                        color:  AppColors.grey,
                        isValidated: false,
                        text: "Exit",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Botnavbar();
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}
