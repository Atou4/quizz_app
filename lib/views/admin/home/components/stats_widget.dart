import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/constants.dart';

class AdminStatsWidget extends ConsumerWidget {
 
  const AdminStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: 120),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.userGraduate,
                    color: AppColors.blue,
                    size:30
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    "Players",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    "100",
                    style: Theme.of(context)
                        .textTheme
                        .button
                  ),
                ],
              ),
              const VerticalDivider(
                thickness: 0.5,
                color: AppColors.grey,
              ),
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.clipboardQuestion,
                    color: AppColors.blue,
                    size:30
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    "quizzes ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(height: defaultPadding / 4), 
                  Text(
                    "5",
                    style: Theme.of(context)
                        .textTheme
                        .button
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
