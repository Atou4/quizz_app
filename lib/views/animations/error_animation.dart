

import 'package:quizz_app/views/animations/lottie_animation_view.dart';
import 'package:quizz_app/views/animations/models/lottie_animation.dart';

class ErrorAnimationView extends LottieanView {
  const ErrorAnimationView({super.key})
      : super(
          animation: LottieAnimation.error,
        );
}