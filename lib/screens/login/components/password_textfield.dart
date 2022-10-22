import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/auth/login/login_controller.dart';
import '../../../widgets/text_field.dart';


class PasswordSignin extends ConsumerWidget {
  const PasswordSignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.password.invalid;
    final signInController = ref.read(signInProvider.notifier);
    return TextInputField(
      hintText: "Password",
      obscureText: true,
      errorText: showError
          ? Password.showPasswordErrorMessage(signInState.password.error)
          : null,
      onChanged: (password) => signInController.onPasswordChange(password),
      icon: Icons.lock,
    );
  }
}