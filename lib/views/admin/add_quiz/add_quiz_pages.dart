import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/views/admin/add_quiz/components/add_quiz_widget.dart';

import '../../../controllers/quiz/quiz_model_controller.dart';
import '../../../models/question_model.dart';
import '../../../widgets/animated_button.dart';
import 'add_quiz._screen.dart';
import 'components/quiz_answer_textfield.dart';
import 'components/quiz_option_textfield.dart';

var pageProvider = StateProvider<int>((ref) => 0);

var quizquestio = StateProvider<String>((ref) => "");
var correctanswer = StateProvider<String>((ref) => "");
var wronganswer1 = StateProvider<String>((ref) => "");
var wronganswer2 = StateProvider<String>((ref) => "");
var wronganswer3 = StateProvider<String>((ref) => "");

class QuizQuestions extends ConsumerWidget {
  const QuizQuestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final PageController _pageController = PageController(
      initialPage: ref.watch(pageProvider),
    );

    final pages = ref.watch(numpages);

    final quizList = ref.watch(quizListControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: AppColors.white, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddQuizz();
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
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          ref.read(pageProvider.state).state = index;
        },
        itemCount: pages,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
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
                      Container(
                        width: size.width,
                        margin: EdgeInsets.only(left: 16, right: 16, top: 100),
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quiz Question ${ref.watch(pageProvider)}',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            QuizzTextfield("Question", ((value) {
                              ref.read(quizquestio.notifier).state = value;
                            }), "false"),
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              'Quiz Correct Answer',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            QuizzAnswerTextfield("Answer 1", ((value) {
                              ref.read(correctanswer.notifier).state = value;
                            }), FontAwesomeIcons.check),
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              'Quiz wrong Answers',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            QuizzAnswerTextfield("Answer 2", ((value) {
                              ref.read(wronganswer1.notifier).state = value;
                            }), FontAwesomeIcons.xmark),
                            const SizedBox(height: defaultPadding / 2),
                            QuizzAnswerTextfield("Answer 3", ((value) {
                              ref.read(wronganswer2.notifier).state = value;
                            }), FontAwesomeIcons.xmark),
                            const SizedBox(height: defaultPadding / 2),
                            QuizzAnswerTextfield("Answer 4", ((value) {
                              ref.read(wronganswer3.notifier).state = value;
                            }), FontAwesomeIcons.xmark),
                            const SizedBox(height: defaultPadding / 2),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: ref.read(pageProvider.state).state == pages
                        ? AnimatedButton(
                            onPressed: () {
                              debugPrint("done");
                              Navigator.pop(context);
                            },
                            isValidated: false,
                            text: 'Done')
                        : AnimatedButton(
                            onPressed: () {
                              quizList.updateQuizQuestion(
                                  quizid: ref.read(quizid.notifier).state,
                                  quiz: QuestionModel(
                                      question:
                                          ref.read(quizquestio.notifier).state,
                                      correctanswer: ref
                                          .read(correctanswer.notifier)
                                          .state,
                                      incorrrectanswer: [
                                        ref.read(wronganswer1.notifier).state,
                                        ref.read(wronganswer2.notifier).state,
                                        ref.read(wronganswer3.notifier).state
                                      ]));
                              ref.read(pageProvider.state).state++;
                              debugPrint(ref.read(pageProvider.notifier).state.toString());
                            },
                            isValidated: false,
                            text: 'Submit'),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        pages,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  _pageController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      ref.watch(pageProvider) == index
                                          ? AppColors.blue
                                          : AppColors.grey,
                                ),
                              ),
                            )),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
