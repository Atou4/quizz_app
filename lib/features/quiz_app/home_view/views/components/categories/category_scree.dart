import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/constants.dart';
import 'package:quizz_app/features/quiz_app/home_view/views/components/categories/categories_grid_list.dart';
import 'package:quizz_app/common_widgets/animated_button.dart';

import '../../../data/data.dart';
import '../../../../../../utils/app_colors.dart';

class CategoryScreen extends ConsumerWidget {
  final bool admin;
  const CategoryScreen({Key? key,required this.admin, }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: AppColors.white,size:30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose Category',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SizedBox(
          height: size.height,
          child: Column(
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
                  ListWidget(120,admin: admin,),
                ],
              ),
              const Spacer(),
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: AnimatedButton(onPressed: (){}, isValidated: false, text: 'Next', color:  AppColors.blue,),
              ),
              const SizedBox(height: defaultPadding,)
            ],
          ),
        ),
      ),
    );
  }
}

class ListWidget extends ConsumerWidget {
   final double topmargin;
   final bool admin;
  const ListWidget(this.topmargin, {Key? key,required this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: 16, right: 16, top: topmargin),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
          Categoriesgridlist(categories: categroieslist, admin: admin,),
        ],
      ),
    );
  }
}
