import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_new_instagram_clone_firebase_riverpod/features/Post/postRepository.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/utils.dart';

class PostController extends StateNotifier<bool> {
  final PostReposotory postReposotory;
  final Ref ref;
  final StorageRepository storageRepository;
  PostController({
    required this.postReposotory,
    required this.ref,
    required this.storageRepository,
  }) : super(false);
}
