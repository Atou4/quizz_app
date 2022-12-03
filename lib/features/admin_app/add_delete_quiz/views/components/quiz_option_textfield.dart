import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../utils/app_colors.dart';

class QuizzTextfield extends ConsumerWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final String? errorText;
  const QuizzTextfield(this.hintText, this.onChanged, this.errorText,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
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
        ),
      ],
    );
  }
}
