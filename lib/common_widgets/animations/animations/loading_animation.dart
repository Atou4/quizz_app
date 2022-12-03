

import 'package:quizz_app/common_widgets/animations/animations/lottie_animation_view.dart';
import 'package:quizz_app/common_widgets/animations/animations/models/lottie_animation.dart';

class LoadingAnimationView extends LottieanView {
  const LoadingAnimationView({super.key})
      : super(
          animation: LottieAnimation.loading,
        );
}