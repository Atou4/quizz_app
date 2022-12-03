import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/quiz_app/user_profile/controllers/userprofile_controller.dart';


final isLoadingProvider =Provider<bool>((ref) {
  final authUser = ref.watch(UserProfileControllerProvider);
  
  //final quizList = ref.watch(quizListControllerProvider);
  
  
  return authUser.isLoading; //|| quizList.isLoading  ;
});