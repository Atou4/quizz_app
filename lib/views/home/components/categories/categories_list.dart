
import 'package:flutter/material.dart';
import 'package:quizz_app/views/home/components/categories/categories_widget.dart';

import '../../../../models/category_model.dart';
import '../../../../utils/app_colors.dart';
class Categorieslist extends StatelessWidget {
  final List<Category> categories;
  const Categorieslist({Key? key,  required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
              final Category = categories[index];
              return  CategpryWidget(cat: Category, color: AppColors.white,);
            },
      )
    );
  }
}