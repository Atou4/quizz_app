

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/extensions/firebase/firebase_firestore_extension.dart';
import 'package:quizz_app/features/quiz_app/auth/models/user_model.dart';

import '../../../../providers/general_providers.dart';
import '../../../../exceptions/custom_exception.dart';



abstract class BaseUserRepository {
  Future<UserModel> retrieveUser({required String userId});
  Future<void> updateUser({required String userId, required UserModel user});
  Future<void> retrieveUsers();
  
}

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository(ref));

class UserRepository implements BaseUserRepository {
  final Ref ref;

  const UserRepository(this.ref);

  @override
  Future<List<UserModel>> retrieveUsers() async {
    try {
      final snap =
          await ref.read(firebaseFirestoreProvider).usersListRef("userId").get();
      return   snap.docs.map((doc) => UserModel.fromDocument(doc)).toList(); 
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<UserModel> retrieveUser({required String userId}) async {
    try {
      final snap =
          await ref.read(firebaseFirestoreProvider).usersListRef(userId).doc(userId).get();
      return  UserModel.fromDocument(snap);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }


  @override
  Future<void> updateUser({required String userId, required UserModel user}) async {
    try {
     await ref.read(firebaseFirestoreProvider)
          .usersListRef(userId)
          .doc(userId)
          .update(user.toDocument());

    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

    
}