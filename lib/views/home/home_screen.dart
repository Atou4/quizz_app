
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/controllers/user/userprofile_controller.dart';
import 'package:quizz_app/models/user_model.dart';
import 'package:quizz_app/utils/app_colors.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.sign_language, color: AppColors.lightcoral),
            onPressed: () {
              ref
                  .read(UserProfileControllerProvider.notifier)
                  .updateUser(updateduser: UserModel(email:"s",name: "s" ));
            },
          ),
        ],
      ),
    );
  }
}
