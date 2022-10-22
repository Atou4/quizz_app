import 'package:flutter/material.dart';

class FadeSwitch extends StatelessWidget {
  final Widget child;
  const FadeSwitch({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: ((child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
            )
        );
      }),
      switchInCurve: Curves.easeIn,
      switchOutCurve:Curves.easeIn, 
      duration:const Duration(milliseconds:400),
      child: child,
    );
  }
}