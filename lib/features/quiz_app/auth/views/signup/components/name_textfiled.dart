
import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/common_widgets/text_field.dart';

import '../../../controllers/signup/signup_controller.dart';



class NameSignup extends ConsumerWidget {
  const NameSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.name.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: "Name",
      obscureText: false,
      errorText: showError
          ? Name.showNameErrorMessage(signUpState.name.error)
          : null,
      onChanged: (name) => signUpController.onNameChange(name),
      icon: Icons.lock,
    );
  }
}