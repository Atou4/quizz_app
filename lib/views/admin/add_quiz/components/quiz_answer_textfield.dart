import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../utils/app_colors.dart';

class QuizzAnswerTextfield extends ConsumerWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final IconData? icon;
  const QuizzAnswerTextfield(this.hintText, this.onChanged,  this.icon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: false,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.blue,
      style: Theme.of(context)
          .textTheme
          .button!
          .copyWith(color: AppColors.black),
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: (){}, icon: FaIcon(icon,size: 20,
        color:
        AppColors.grey
        ),),
        filled: true,
        fillColor: const Color.fromRGBO(248, 247, 251, 1),
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.blue,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.blue,
            )),
      ),
    );
  }
}
