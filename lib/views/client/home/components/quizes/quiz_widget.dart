import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/models/quiz_model.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/views/client/quiz_game/quiz_game.dart';

import '../../../../../controllers/quiz/quiz_model_controller.dart';
import '../../../../../utils/app_colors.dart';

class QuizItem extends ConsumerWidget {
  final bool admin;
  final QuizModel quiz;
  const QuizItem({
    Key? key,
    required this.admin,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final quizList = ref.watch(quizListControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: GestureDetector(
        onTap: (() {
          admin==false
          ?
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return QuizGameScreen(quiz: quiz,);
                },
              ),
            )
           :null; 
        }),
        child: ListTile(
          shape: RoundedRectangleBorder( 
        side: BorderSide(width: 1,color: AppColors.blue),
        borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          trailing: admin
              ? IconButton(
                  onPressed: () {
                    debugPrint(quiz.id);
                    quizList.deleteItem(quizId: quiz.id.toString());
                  },
                  icon: FaIcon(FontAwesomeIcons.xmark,
                      size: 20, color: AppColors.lightcoral),
                )
              : null,
          leading: FaIcon(FontAwesomeIcons.gamepad,
              size: 35, color: AppColors.blue),
          title: Text(
            quiz.quizname.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.black),
            textAlign: TextAlign.justify,
          ),
          subtitle: Text(
            'Quiz Difficulty: ${quiz.difficulty}',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: AppColors.blue),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
