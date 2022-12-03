import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';

import '../../../../../utils/constants.dart';

final duration = StateProvider<int>((ref) {
  return 0;
});

class DropQuizTime extends StatefulWidget {
  final List<int> dropdownlist;
  const DropQuizTime({super.key, required this.dropdownlist});

  @override
  State<DropQuizTime> createState() => _DropQuizTimeState();
}

class _DropQuizTimeState extends State<DropQuizTime> {
 
  

  @override
  Widget build(BuildContext context) {
     int dropdownvalue = widget.dropdownlist[0];
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
        icon: const FaIcon(FontAwesomeIcons.chevronDown,color: AppColors.grey,size: 20),
        items: widget.dropdownlist.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items.toString()),
          );
        }).toList(),
        onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue!.toInt();
                });
                 ref.read(duration.notifier).state=dropdownvalue;
              },
      );   
        },
      )
    );
  }
}
