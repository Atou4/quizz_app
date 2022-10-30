
import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/auth/login/login_controller.dart';
import '../../../../widgets/text_field.dart';

class EmailSignin extends ConsumerWidget {
  const EmailSignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.email.invalid;
    final signInController = ref.read(signInProvider.notifier);
    return TextInputField(
      hintText: "Email",
      errorText: showError
          ? Email.showEmailErrorMessage(signInState.email.error)
          : null,
      onChanged: (email) => signInController.onEmailChange(email),
      icon: Icons.person,
    );
  }
}