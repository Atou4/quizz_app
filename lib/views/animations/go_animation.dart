

import 'package:quizz_app/views/animations/lottie_animation_view.dart';
import 'package:quizz_app/views/animations/models/lottie_animation.dart';

class goAnimationView extends LottieanView {
  const goAnimationView({super.key})
      : super(
          animation: LottieAnimation.start,
        );
}