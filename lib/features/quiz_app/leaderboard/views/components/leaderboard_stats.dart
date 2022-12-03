
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexagon/hexagon.dart';
import 'package:quizz_app/utils/app_colors.dart';

import '../../../../../utils/constants.dart';

class LeaderboWidget extends StatelessWidget {
  const LeaderboWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, top: 120),
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      HexagonWidget.pointy(
                        width: 60,
                        color: AppColors.blue,
                        padding: 4.0,
                        child: FaIcon(FontAwesomeIcons.trophy,
                            color: Colors.yellowAccent, size: 30),
                      ),
                      const SizedBox(height: defaultPadding ),
                      FaIcon(FontAwesomeIcons.solidStar,
                          color: AppColors.blue, size: 30),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "Points",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text("1025", style: Theme.of(context).textTheme.button),
                    ],
                  ),
                  const VerticalDivider(
                    thickness: 0.5,
                    color: AppColors.grey,
                  ),
                  Column(
                    children: [
                      HexagonWidget.pointy(
                        width: 60,
                        color: AppColors.blue,
                        padding: 4.0,
                        child: FaIcon(FontAwesomeIcons.award,
                            color: Colors.yellowAccent, size: 30),
                      ),
                      const SizedBox(height: defaultPadding ),
                      FaIcon(FontAwesomeIcons.globe,
                          color: AppColors.blue, size: 30),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "World Rank",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text("1025", style: Theme.of(context).textTheme.button),
                    ],
                  ),
                  const VerticalDivider(
                    thickness: 0.5,
                    color: AppColors.grey,
                  ),
                  Column(
                    children: [
                      HexagonWidget.pointy(
                        width: 60,
                        color: AppColors.blue,
                        padding: 4.0,
                        child: FaIcon(FontAwesomeIcons.ribbon,
                            color: Colors.yellowAccent, size: 30),
                      ),
                      const SizedBox(height: defaultPadding ),
                      FaIcon(FontAwesomeIcons.trophy,
                          color: AppColors.blue, size: 30),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "Trophies ",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text("1025", style: Theme.of(context).textTheme.button),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}