

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';
import '../../client/home/components/categories/category_scree.dart';
import 'components/stats_widget.dart';

class AdminHomeScreen extends ConsumerWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Admin Panel',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height / 3.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
                AdminStatsWidget(),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            ListWidget(0, admin: true,),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
