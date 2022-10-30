import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/user/userprofile_controller.dart';


final isLoadingProvider =Provider<bool>((ref) {
  final authUser = ref.watch(UserProfileControllerProvider);
  
  return authUser.isLoading;
});