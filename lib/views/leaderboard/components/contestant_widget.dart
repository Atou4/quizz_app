import 'package:flutter/material.dart';
import 'package:quizz_app/utils/constants.dart';

import '../../../utils/app_colors.dart';

class ContestantWidget extends StatelessWidget {
  const ContestantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          ClipOval(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/image.jpg",
                        ),
                      )))),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "mohammed hijab",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    "talk to me nice or dont talk to me at all baby boy girl whatsoever",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: AppColors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Points",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: AppColors.grey),
              ),
              Text(
                "48890",
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: AppColors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
