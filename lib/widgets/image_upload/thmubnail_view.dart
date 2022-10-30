import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/animations/error_animation.dart';

import '../../models/image_upload/thumbnail_request.dart';
import '../../providers/image_upload/thumbnail_provider.dart';
import '../../views/animations/loading_animation.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnailRequest thumbnailRequest;

  const FileThumbnailView({
    Key? key,
    required this.thumbnailRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnailProvider(
         thumbnailRequest,
      ),
    );

    return thumbnail.when(
      data: (imageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: imageWithAspectRatio.aspectRatio,
          child: imageWithAspectRatio.image,
        );
      },
      loading: () {
        return const LoadingAnimationView();
      },
      error: (error, stackTrace) {
        return const ErrorAnimationView();
      },
    );
  }
}