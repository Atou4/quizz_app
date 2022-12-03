import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:quizz_app/features/quiz_app/user_profile/models/image_upload/file_type.dart';

part "user_model.freezed.dart";
part "user_model.g.dart";

@freezed
abstract class UserModel implements _$UserModel {
  const UserModel._();

  const factory UserModel({
   String? id,
   required String?  name,
   required String? email,
   String?  bio, token,
   FileType? fileType,
   String? fileuRl,filenameoriginalfilestorageid,
   double? aspectRatio,


    @Default(false) bool obtained,
  }) = _UserModel;

  factory UserModel.empty() => UserModel(name: '',email:"");

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!as Map<String, dynamic>;
    return UserModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}