

import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/common_widgets/text_field.dart';
import '../../../controllers/signup/signup_controller.dart';
class EmailSugnup extends ConsumerWidget {
  const EmailSugnup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.email.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      obscureText: false,
      hintText: "Email",
      errorText: showError
          ? Email.showEmailErrorMessage(signUpState.email.error)
          : null,
      onChanged: (email) => signUpController.onEmailChange(email),
      icon: Icons.person,
    );
  }
}