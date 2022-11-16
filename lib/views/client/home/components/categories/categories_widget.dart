
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizz_app/models/category_model.dart';
import 'package:quizz_app/utils/app_colors.dart';
import 'package:quizz_app/utils/constants.dart';

class CategpryWidget extends StatelessWidget {
  final Category cat;
  final Color? color;
  const CategpryWidget({
    Key? key, required this.cat, required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(
                  right: defaultPadding,) ,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
          ClipRRect(
            child: Container(
              margin: EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  top: defaultPadding),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.blue,
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Center(
                child: FaIcon(
                  cat.caticon,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 4),
          Text(
            cat.catname,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: AppColors.grey),
          ),
          const SizedBox(height: defaultPadding / 4),
        ],
      ),
    );
  }
}
