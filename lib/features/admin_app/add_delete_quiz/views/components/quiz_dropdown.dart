import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';

import '../../../../quiz_app/home_view/data/data.dart';
import '../../../../../utils/constants.dart';

final category = StateProvider<String>((ref) {
  return "0";
});

class DropQuiz extends StatefulWidget {
  const DropQuiz({super.key});

  @override
  State<DropQuiz> createState() => _DropQuizState();
}

class _DropQuizState extends State<DropQuiz> {
  String dropdownvalue = categroieslist[0].catname;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightblue,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding:  EdgeInsets.symmetric(
          horizontal: defaultPadding/2,),
      child: Consumer(
        builder: (context, ref, child) {
          return DropdownButton(
          borderRadius: BorderRadius.circular(10),
          isExpanded: true,
          style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: AppColors.grey),
          value: dropdownvalue,
          icon: const FaIcon(FontAwesomeIcons.chevronDown,color: AppColors.grey,size: 20,),
          items: categroieslist.map((items) {
            return DropdownMenuItem(
              value: items.catname,
              child: Text(items.catname),
            );
          }).toList(),
          onChanged: (newValue) {
                  setState(() {
                    dropdownvalue = newValue.toString();
                  });
                  ref.read(category.notifier).state=dropdownvalue;
                },
        );
        },
      ),
    );
  }
}
