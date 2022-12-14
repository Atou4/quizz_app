import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/common_widgets/animated_button.dart';


import '../../../../../../utils/app_colors.dart';
import '../../../controllers/login/login_controller.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isloading = false; 
    final signInState = ref.watch(signInProvider);
    final bool isValidated = signInState.status.isValidated;
    final signInController = ref.read(signInProvider.notifier);
    return AnimatedButton(
      color:  AppColors.blue,
      isloading: isloading,
      onPressed:  () => signInController.signInWithEmailAndPassword(),
      text: "Sign In",
      isValidated: isValidated,
    );
  }
}

