import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/controllers/auth/signup/signup_controller.dart';
import 'package:quizz_app/screens/login/components/login_topscreen.dart';
import 'package:quizz_app/screens/login/login_screen.dart';
import 'package:quizz_app/screens/signup/components/email_textfield.dart';
import 'package:quizz_app/screens/signup/components/password_textfield.dart';
import 'package:quizz_app/widgets/loading_error.dart';

import '../../utils/constants.dart';
import '../../widgets/have_an_acc.dart';
import 'components/name_textfiled.dart';
import 'components/signup_button.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignUpState>(
      signUpProvider,
      (previous, current) {
        if (current.status.isSubmissionInProgress) {
          Loadingsc.show(context,"");
        } else if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          Errordialog.show(context, "${current.errorMessage}");
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
                      NameSignup(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: EmailSugnup(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: PasswordSignup(),
                      ),
                      const SizedBox(height: defaultPadding),
                      Hero(
                        tag: "signup_btn",
                        child: SignUnButton(),
                      ),
                     const SizedBox(height: defaultPadding),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
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



