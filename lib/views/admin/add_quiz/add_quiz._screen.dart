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

class AddQuizz extends ConsumerStatefulWidget {
  const AddQuizz({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddQuizzState();
}

class _AddQuizzState extends ConsumerState<AddQuizz>
    with TickerProviderStateMixin {
  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration =
      _initialDelayTime + (_staggerTime * 4) + _buttonDelayTime + _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < 4; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime = Duration(milliseconds: (4 * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.white,
            size: 30,
          ),
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
                  AnimatedBuilder(
                    animation: _staggeredController,
                  builder: (context, child) {
                    final animationPercent = Curves.elasticOut.transform(
                        _buttonInterval.transform(_staggeredController.value));
                    final opacity = animationPercent.clamp(0.0, 1.0);
                    final scale = (animationPercent * 0.5) + 0.5;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scale,
                        child: child,
                      ),
                    );
                  },
                    child: AddWidget()),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: AnimatedBuilder(
                  animation: _staggeredController,
                  builder: (context, child) {
                    final animationPercent = Curves.elasticOut.transform(
                        _buttonInterval.transform(_staggeredController.value));
                    final opacity = animationPercent.clamp(0.0, 1.0);
                    final scale = (animationPercent * 0.5) + 0.5;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scale,
                        child: child,
                      ),
                    );
                  },
                  child: AnimatedButton(
                      color: AppColors.blue,
                      onPressed: () {
                        quizList.createQuiz(
                            quiz: QuizModel(
                                quizname: question_name,
                                category: category_name,
                                difficulty: duration_minutes));
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
              ),
              const SizedBox(
                height: defaultPadding * 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
