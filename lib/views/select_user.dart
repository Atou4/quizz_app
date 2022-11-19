import 'package:flutter/material.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/views/auth/signup/signup_screen.dart';
import 'package:quizz_app/widgets/animated_button.dart';

import '../utils/app_colors.dart';
import 'admin/admin_bottomnav.dart';

class ChooseUser extends StatelessWidget {
  const ChooseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.lightblue,
      body: Column(
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
            text: "Signup",
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
    );
  }
}
