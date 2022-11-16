
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/client/home/components/categories/categories_widget.dart';

import '../../../../../models/category_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../widgets/animations/animated_in_effect.dart';
import '../quizes/quiz_list.dart';
import '../quizes/quiz_list_screen.dart';
class Categorieslist extends ConsumerWidget {
  final List<Category> categories;
  const Categorieslist({Key? key,  required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              return  AnimateInEffect(
            keepAlive: true,
            intervalStart: index / categories.length,
            child: GestureDetector(
                onTap: (() {
                   ref.read(categorynameprovider.notifier).state=Category.catname;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QuizListScreen(
                            admin: false, category: Category.catname);
                      },
                    ),
                  );
                }),
                child: CategpryWidget(
                  cat: Category,
                  color: AppColors.white,
                )),
          );
            },
      )
    );
  }
}