import 'package:flutter/material.dart';
import 'package:quizz_app/utils/app_colors.dart';
import 'package:quizz_app/widgets/fade_switcher.dart';

import '../utils/constants.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final String? errorText;
  final bool obscureText;
  final IconData icon;

  const TextInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.icon,
    this.errorText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: AppColors.blue,
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: AppColors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(248, 247, 251, 1),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: AppColors.grey),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Icon(
                icon,
                color: AppColors.blue,
                size: 16,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: AppColors.blue,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(
                  color: AppColors.blue,
                )),
          ),
        ),
        FadeSwitch(
          child: errorText !=null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                   errorText!,
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: AppColors.lightcoral),
                  ),
                )
              : SizedBox.shrink(),
        )
      ],
    );
  }
}
