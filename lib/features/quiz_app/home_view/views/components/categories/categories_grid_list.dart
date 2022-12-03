import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/features/quiz_app/home_view/views/components/quizes/quiz_list.dart';

import '../../../models/category_model.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../common_widgets/animations/animated_in_effect.dart';
import '../quizes/quiz_list_screen.dart';
import 'categories_widget.dart';

class Categoriesgridlist extends ConsumerWidget {
  final List<Category> categories;
  final bool admin;
  const Categoriesgridlist(
      {Key? key, required this.categories, required this.admin})
      : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
          return AnimateInEffect(
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
                            admin: admin, category: Category.catname);
                      },
                    ),
                  );
                }),
                child: CategpryWidget(
                  cat: Category,
                  color: AppColors.lightblue,
                )),
          );
        },
      ),
    );
  }
}
