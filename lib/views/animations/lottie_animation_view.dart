import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizz_app/views/animations/models/lottie_animation.dart';

class LottieanView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;
  const LottieanView({super.key, required this.animation,  this.repeat=true,  this.reverse=false});

  @override
  Widget build(BuildContext context) 
    => LottieBuilder.asset(animation.fullPath,
    reverse: reverse,
    repeat: repeat,
    );
}

extension Getfullpath on LottieAnimation{
  String get fullPath =>"assets/animations/$name.json";
}