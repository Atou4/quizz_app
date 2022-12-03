import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/features/quiz_app/home_view/views/components/quizes/quiz_list.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/constants.dart';

class QuizListScreen extends ConsumerWidget {
  final String category;
  final bool admin;
  const QuizListScreen( {super.key,required this.category,required this.admin});

  

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
          category,
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
                ],
              ),
              const SizedBox(height: defaultPadding,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                      'Quizes',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.justify,
                    ),
              ),
              const SizedBox(height: defaultPadding,),
              Expanded(
                child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: QuizesList(categoryname: category,admin: admin,),
                ),
              ),
            ],
          ),
        ),
      ));
  }
}