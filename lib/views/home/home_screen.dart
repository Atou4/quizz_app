import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/home/components/categories/category_scree.dart';

import '../../data/data.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import 'components/categories/categories_list.dart';
import 'components/stats_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: AppColors.white,
            size: 20,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Quizzy',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bell,
              color: AppColors.white,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
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
                StatsWidget(),
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
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryScreen()),
                      );
                    },
                    child: Text(
                      'See All',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: AppColors.blue),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: SizedBox(
                height: 90,
                child: Categorieslist(
                  categories: categroieslist,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Container(
                width: size.width,
                margin: EdgeInsets.only(
                    left: defaultPadding, right: defaultPadding),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.userPlus,
                          color: AppColors.blue, size: 40),
                      const SizedBox(width: defaultPadding),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Play with a friend',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              'Invite your friend to start a quiz with u',
                              style: Theme.of(context).textTheme.caption,
                              textAlign: TextAlign.justify,
                            ),
                          ])
                    ],
                  ),
                )),
            const SizedBox(height: defaultPadding),
            Container(
                width: size.width,
                margin: EdgeInsets.only(
                    left: defaultPadding, right: defaultPadding),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.gamepad,
                          color: AppColors.lightblue, size: 40),
                      const SizedBox(width: defaultPadding),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start a quick quiz',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: AppColors.lightblue),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              'Climb up the Quizzy leaderboar',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: AppColors.lightblue),
                              textAlign: TextAlign.justify,
                            ),
                          ]),
                      const SizedBox(width: defaultPadding / 4),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2,
                                  vertical: defaultPadding / 2),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.arrowRight,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
