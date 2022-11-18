import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';

import '../../../../controllers/auth/signup/signup_controller.dart';
import '../../../../widgets/animated_button.dart';

class SignUnButton extends ConsumerWidget {
  const SignUnButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final bool isValidated = signUpState.status.isValidated;
    return AnimatedButton(
      onPressed:  () => signUpController.signUpWithEmailAndPassword(),
      isValidated: isValidated,
      text: "Sign Up", color: AppColors.blue,
    );
  }
}