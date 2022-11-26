
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/controllers/auth/auth_controller.dart';
import 'package:quizz_app/extensions/image_upload/get_collectionname_from_file_type.dart';
import 'package:quizz_app/extensions/image_upload/get_image_data_aspecctratio.dart';
import 'package:quizz_app/models/user_model.dart';
import 'package:quizz_app/repositories/userprofile_repository.dart';
import 'package:uuid/uuid.dart';

import '../../models/image_upload/file_type.dart';
import '../../repositories/exceptions/custom_exception.dart';

import 'package:image/image.dart' as img;
import 'dart:io';
import 'dart:typed_data';

import '../../utils/constants.dart';

final UserProfileExceptionProvider = StateProvider<CustomException?>((_) => null);

final UserProfileControllerProvider =
    StateNotifierProvider<UserProfileController, AsyncValue<UserModel>>(
  (ref) {
    final user = ref.watch(authProvider);
    return UserProfileController(ref, user.user.id);
  },
);

class UserProfileController extends StateNotifier<AsyncValue<UserModel>> {
  final Ref ref;
  final String? _userId;

  UserProfileController(this.ref, this._userId) : super(AsyncValue.data(UserModel.empty())) {
    retrieveusers() ;
    if (_userId != null) {
      retrieveuser();
    }
  }

  Future<void> retrieveusers() async {
    
    try {
        final users = await ref
            .read(userRepositoryProvider)
            .retrieveUsers();
        if (mounted) {
          state = AsyncValue.data(UserModel(name: "name", email: "email",aspectRatio: users.length.ceilToDouble()));
        }
        
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> retrieveuser() async {
    
    try {
      if (_userId!.isNotEmpty) {
        final users = await ref
            .read(userRepositoryProvider)
            .retrieveUser(userId: _userId!);
        if (mounted) {
          state = AsyncValue.data(users);
        }
      }
      
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateUser({required UserModel updateduser}) async {
    try {
      state = AsyncValue.loading();
      await ref.read(userRepositoryProvider)
          .updateUser(userId: _userId!, user: updateduser);
          if (mounted) {
          state = AsyncValue.data(updateduser);
        }
    } on CustomException catch (e) {
      ref.read(UserProfileExceptionProvider.notifier).state=e ;
    }
  }

    Future<bool> upload({
    required File file,
  }) async {
    state = AsyncValue.loading();

    late Uint8List thumbnailUint8List;
    final FileType fileType=FileType.image;
    
    final user = await ref
            .read(userRepositoryProvider)
            .retrieveUser(userId: _userId!);
   
    switch (fileType) {
      case FileType.image:
        // create a thumbnail out of the file
        final fileAsImage = img.decodeImage(file.readAsBytesSync());
        if (fileAsImage == null) {
          state = AsyncValue.data(user);
          return false;
        }
        // create thumbnail
        final thumbnail = img.copyResize(
          fileAsImage,
          width: Constants.imageThumbnailWidth,
        );
        final thumbnailData = img.encodeJpg(thumbnail);
        thumbnailUint8List = Uint8List.fromList(thumbnailData);
        break;
      case FileType.video:
        break;
    }

    final thumbnailAspectRatio = await thumbnailUint8List.getAspectRatio();

  

    final fileName = const Uuid().v4();



    final originalFileRef = FirebaseStorage.instance
        .ref()
        .child(user.id.toString())
        .child(fileType.collectionName)
        .child(fileName);

    try {

      // upload the original image
      await originalFileRef.putFile(file);

      updateUser(updateduser: UserModel(name: user.name, email: user.email ,aspectRatio: thumbnailAspectRatio,fileType:fileType ,fileuRl:await originalFileRef.getDownloadURL() ,id: user.id ));
      
      return true;
    } catch (_) {
      return false;
    } finally{
      state = AsyncValue.data(user);
    }
  }





}