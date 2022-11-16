import 'package:flutter/material.dart';
import 'package:quizz_app/views/client/leaderboard/components/contestant_widget.dart';

class Contestantlist extends StatelessWidget {
  final List<String>? articles;
  const Contestantlist({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: articles!.length,
          itemBuilder: (BuildContext context, int index) {
           // final article = articles![index];
            return ContestantWidget();
          },
        ));
  }
}