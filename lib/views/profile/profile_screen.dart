import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/controllers/user/userprofile_controller.dart';
import 'package:quizz_app/views/animations/error_animation.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../widgets/image_upload/image_picker_helper.dart';
import 'components/profile_info.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authController = ref.read(authProvider.notifier);
    final authUser = ref.watch(UserProfileControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout_outlined, color: AppColors.white),
          onPressed: () {
            authController.onSignOut();
          },
        ),
        title: Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height / 3,
                  width: size.width,
                  color: AppColors.blue,
                ),
                Profilewidget(),
                (authUser.value?.fileuRl != null)
                    ? Container(
                        margin: EdgeInsets.only(left: 32, top: 80),
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  authUser.value!.fileuRl.toString()),
                            )))
                    : Container(
                        margin: EdgeInsets.only(left: 32, top: 80),
                        width: 80.0,
                        height: 80.0,
                        child: ErrorAnimationView(),
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Profilewidget extends ConsumerWidget {
  const Profilewidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authUser = ref.watch(UserProfileControllerProvider);

    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: 16, right: 16, top: 120),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
          const SizedBox(height: defaultPadding / 2),
          Text(
            authUser.hasValue ? authUser.value!.name.toString() : "",
            style: Theme.of(context).textTheme.headline6,
          ),
          GestureDetector(
            onTap: () async {
              final imageFile = await ImagePickerHelper.pickImageFromGallery();
              if (imageFile == null) {
                return;
              }
               await ref
                  .read(UserProfileControllerProvider.notifier)
                  .upload(file: imageFile);
            },
            child: Text(
              "Change profile picture",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: AppColors.grey),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Profileinfo(
              header: 'Full name',
              info: authUser.hasValue ? authUser.value!.name.toString() : ""),
          const SizedBox(height: defaultPadding / 2),
          Profileinfo(
              header: 'Email',
              info: authUser.hasValue ? authUser.value!.email.toString() : ""),
          const SizedBox(height: defaultPadding / 2),
          Profileinfo(
            header: 'Id',
            info: authUser.hasValue ? authUser.value!.id.toString() : "",
          ),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
