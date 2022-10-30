import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

class LoginScreenTopImage extends StatefulWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenTopImage> createState() => _LoginScreenTopImageState();
}

class _LoginScreenTopImageState extends State<LoginScreenTopImage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation= CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

   @override
   void dispose(){
    controller.dispose();
    super.dispose();
    
   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: ScaleTransition(
                  scale: animation,
                  child: Image.asset("assets/images/image.jpg")),
            ),
            const Spacer(),
          ],
        ),
        
      ],
    );
  }
}
