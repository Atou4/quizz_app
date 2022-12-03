import 'package:flutter/material.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/features/quiz_app/auth/views/signup/signup_screen.dart';
import 'package:quizz_app/common_widgets/animated_button.dart';

import 'utils/app_colors.dart';
import 'features/admin_app/admin_bottomnav.dart';

class ChooseUser extends StatelessWidget {
  const ChooseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.lightblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              isValidated: false,
              text: "Admin Panel",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AdminBotnavbar();
                    },
                  ),
                );
              },
              color: AppColors.blue,
            ),
            const SizedBox(height: defaultPadding,),
            AnimatedButton(
              isValidated: false,
              text: "Client App",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
