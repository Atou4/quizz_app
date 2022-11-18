import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/controllers/quiz/quiz_model_controller.dart';
import 'package:quizz_app/models/quiz_model.dart';
import 'package:quizz_app/repositories/exceptions/custom_exception.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/views/admin/add_quiz/components/quiz_dropdown_time.dart';
import 'package:quizz_app/views/admin/admin_bottomnav.dart';
import 'package:quizz_app/widgets/animated_button.dart';

import '../../../../../utils/app_colors.dart';
import 'add_quiz_pages.dart';
import 'components/quiz_dropdown.dart';
import 'components/add_quiz_widget.dart';


final quizid = StateProvider<String>((ref) {
  return "";
});

class AddQuizz extends ConsumerWidget {
  const AddQuizz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final quizList = ref.watch(quizListControllerProvider.notifier);

    final question_name = ref.watch(question);
    final category_name = ref.watch(category);
    final duration_minutes = ref.watch(duration);

    ref.listen<StateController<CustomException?>>(
          quizListExceptionProvider.state,
          (previous, current) {
            debugPrint(current.state!.message.toString());
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(current.state!.message!),
            ),
          );
          },
        );
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: AppColors.white,size: 30,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AdminBotnavbar();
                },
              ),
            );
          },
        ),
        title: Text(
          'Create Quizz',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SizedBox(
          height: size.height,
          child: Column(
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
                  AddWidget(),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: AnimatedButton(
                  color:  AppColors.blue,
                    onPressed: () {
                    quizList.createQuiz(quiz: QuizModel(quizname: question_name, category: category_name, difficulty: duration_minutes));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return QuizQuestions();
                          },
                        ),
                      );
                    },
                    isValidated: false,
                    text: 'Continue'),
              ),
              const SizedBox(
                height: defaultPadding*2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
