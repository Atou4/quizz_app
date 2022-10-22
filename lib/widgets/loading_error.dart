
import 'package:flutter/material.dart';
import 'package:quizz_app/utils/app_colors.dart';

class Errordialog extends StatelessWidget {
  final String errorText;
  const Errordialog({
    Key? key, required this.errorText,
  }) : super(key: key);

  static Future<void> show(BuildContext context,String errorText) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Errordialog(errorText: errorText,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(errorText, style: Theme.of(context).textTheme.bodyText1),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}

class Loadingsc extends StatelessWidget {
  const Loadingsc({
    Key? key,
  }) : super(key: key);

  static Future<void> show(BuildContext context,String errorText) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Loadingsc();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      actions: [
       Center(
         child: CircularProgressIndicator(color: AppColors.blue,)
       )],);
  }
}
