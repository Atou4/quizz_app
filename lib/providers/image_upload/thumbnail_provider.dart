import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/extensions/image_upload/get_image_aspect_ratio.dart';
import 'package:quizz_app/models/image_upload/file_type.dart';
import 'package:quizz_app/models/image_upload/image_aspect_ratio.dart';
import 'package:quizz_app/models/image_upload/thumbnail_request.dart';

final thumbnailProvider = FutureProvider.family
    .autoDispose<ImageWithAspectRatio, ThumbnailRequest>(
        (ref, ThumbnailRequest request) async {
  final Image image;

  switch (request.fileType) {
    case FileType.image:
      image = Image.file(
        request.file,
        fit: BoxFit.fitHeight,
      );
      break;
    case FileType.video:
      image = Image.file(
        request.file,
        fit: BoxFit.fitHeight,
      );
  }
  final aspectRation = await image.getAspectRatio();
  return ImageWithAspectRatio(
    image: image,
    aspectRatio: aspectRation,
  );
});
