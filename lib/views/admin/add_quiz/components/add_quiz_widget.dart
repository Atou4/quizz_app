import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/views/admin/add_quiz/components/quiz_dropdown.dart';
import 'package:quizz_app/views/admin/add_quiz/components/quiz_dropdown_time.dart';
import 'package:quizz_app/views/admin/add_quiz/components/quiz_option_textfield.dart';

import '../../../../utils/app_colors.dart';

final numpages = StateProvider<int>((ref) {
  return 0;
});

final question = StateProvider<String>((ref) {
  return "";
});

List<int> time = [
  1,
  2,
  3,
  4,
];

class AddWidget extends ConsumerStatefulWidget {
  const AddWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends ConsumerState<AddWidget>
    with TickerProviderStateMixin {
  late AnimationController _staggeredController;

  @override
  void initState() {
    
    super.initState();

    _staggeredController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }


  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return 
    Container(
      width: size.width,
      margin: EdgeInsets.only(left: 16, right: 16, top: 100),
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
          ..._buildListItems(),
        ],
      ),
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    final _sunMoveAnim =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(500, 0))
          .animate(_staggeredController);
    for (var i = 0; i < 4; ++i) {
      listItems.add(
        AnimatedBuilder(
            animation: _sunMoveAnim,
            builder: (context, child) {
              return Transform.translate(
                offset:_sunMoveAnim.value ,
                child: child,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (i == 0) ...[
                  Text(
                    'Quiz Name',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  QuizzTextfield("Name", ((value) {
                    ref.read(question.notifier).state = value;
                  }), "false"),
                  const SizedBox(height: defaultPadding),
                ],
                if (i == 1) ...[
                  Text(
                    'Quiz Category',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  DropQuiz(),
                  const SizedBox(height: defaultPadding),
                ],
                if (i == 2) ...[
                  Text(
                    'Number of Questions',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  QuizzTextfield("Number", ((value) {
                    ref.read(numpages.notifier).state = int.parse(value);
                  }), "false"),
                  const SizedBox(height: defaultPadding),
                ],
                if (i == 3) ...[
                  Text(
                    'Quiz Duration',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  DropQuizTime(
                    dropdownlist: time,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  
                ],
              ],
            )),
      );
    }
    return listItems;
  }
}
