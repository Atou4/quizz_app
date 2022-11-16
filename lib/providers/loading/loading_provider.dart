import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/controllers/quiz/quiz_model_controller.dart';

import '../../controllers/user/userprofile_controller.dart';


final isLoadingProvider =Provider<bool>((ref) {
  final authUser = ref.watch(UserProfileControllerProvider);
  
  //final quizList = ref.watch(quizListControllerProvider);
  
  
  return authUser.isLoading; //|| quizList.isLoading  ;
});