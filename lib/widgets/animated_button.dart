import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AnimatedButton extends StatefulWidget {
  final bool isloading;
  final bool isValidated;
  final String text;
  final VoidCallback? onPressed;
  const AnimatedButton(
      {super.key,
      required this.onPressed,
      this.isloading = false,
      required this.isValidated, required this.text});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        height: 50,
        child: widget.isValidated ==false
            ? OutlinedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: AppColors.blue,
                  shape: const StadiumBorder(),
                ),
                onPressed: widget.onPressed,
                child: Text(
                  widget.text,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: AppColors.white),
                ))
            :
             
            GestureDetector(
              onTap: widget.onPressed ,
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blue),
                  child: Icon(
                          Icons.done,
                          color: AppColors.green,
                          size: 30,
                        )),
            ));
  }
}
