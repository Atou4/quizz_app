
import 'package:flutter/material.dart';

import '../../../../models/category_model.dart';
import '../../../../utils/app_colors.dart';
import 'categories_widget.dart';

class Categoriesgridlist extends StatelessWidget {
  final List<Category> categories;
  const Categoriesgridlist({Key? key,  required this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 12,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: categories.length, 
        itemBuilder: (BuildContext context, int index) {
              final Category = categories[index];
              return  CategpryWidget(cat: Category, color: AppColors.lightblue,);
            },
      ),
    );
  }
}