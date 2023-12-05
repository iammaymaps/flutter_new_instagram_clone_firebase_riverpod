import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/Failure.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/typedef.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/Post/postModels.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final postReposotoryProvider = Provider((ref) {
  return PostReposotory(firestore: FirebaseFirestore.instance);
});

class PostReposotory {
  final FirebaseFirestore firestore;
  PostReposotory({
    required this.firestore,
  });

  CollectionReference get _post => firestore.collection('posts');

  FutureVoid addPost(PostModels post) async {
    try {
      return right(_post.doc(post.postId).set(post.toMap()));
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
