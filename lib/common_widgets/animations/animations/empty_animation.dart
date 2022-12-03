

import 'package:quizz_app/common_widgets/animations/animations/lottie_animation_view.dart';
import 'package:quizz_app/common_widgets/animations/animations/models/lottie_animation.dart';

class EmptyContentsAnimationView extends LottieanView {
  const EmptyContentsAnimationView({super.key})
      : super(
          animation: LottieAnimation.datanofound,
        );
}