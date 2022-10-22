import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/screens/login/components/login_topscreen.dart';
import 'package:quizz_app/screens/login/components/password_textfield.dart';

import '../../controllers/auth/login/login_controller.dart';
import '../../utils/constants.dart';
import '../../widgets/have_an_acc.dart';
import '../../widgets/loading_error.dart';
import '../signup/signup_screen.dart';
import 'components/email_textfield.dart';
import 'components/signin_button.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(
      signInProvider,
      (previous, current) {
        if (current.status.isSubmissionInProgress) {
          Loadingsc.show(context, "errorText");
        } else if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          Errordialog.show(context,"${current.errorMessage}");
        } else if (current.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        }
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const LoginScreenTopImage(),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      EmailSignin(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: PasswordSignin(),
                      ),
                      const SizedBox(height: defaultPadding),
                      Hero(
                        tag: "login_btn",
                        child: SignInButton(),
                      ),
                      const SizedBox(height: defaultPadding),
                      AlreadyHaveAnAccountCheck(
                        login: true,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



