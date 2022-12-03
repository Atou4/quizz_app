import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/constants.dart';

class Profileinfo extends StatelessWidget {
  final String header;
  final String info;
  const Profileinfo({Key? key, required this.header, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightblue,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: defaultPadding / 2),
          Text(
            header,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: AppColors.grey),
          ),
          Text(
            info,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
