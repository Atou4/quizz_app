import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/foundation.dart' show immutable;

final FirebaseFirestore _db = FirebaseFirestore.instance;
final usersRef = _db.collection('users');

final chatsRef = _db.collection('chats');

final FirebaseStorage _storage = FirebaseStorage.instance;
final storageRef = _storage.ref();

enum AuthError {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  invalidCredential,
  operationNotAllowed,
  weakPassword,
  error,
}

const double defaultPadding = 16.0;

@immutable
class Constants {
  // for photos
  static const imageThumbnailWidth = 150;

  // for videos
  static const videoThumbnailMaxHeight = 400;
  static const videoThumbnailQuality = 75;

  const Constants._();
}