import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/Failure.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/typedef.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/utils.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/model/userModel.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    storageRepository: ref.watch(storageRepositoryProvider)));

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final StorageRepository storageRepository;
  AuthRepository({
    required this.firebaseAuth,
    required this.firestore,
    required this.storageRepository,
  });

  CollectionReference get _users =>
      firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  FutureEither<UserModel> signUpWithEmailandPassword(
      {required String email,
      required String password,
      required String username,
      required String fullname,
      required Uint8List file}) async {
    try {
      UserModel userModel;
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          fullname.isNotEmpty &&
          file != null) {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        if (userCredential.additionalUserInfo!.isNewUser) {
          String photoUrl = await storageRepository.uploadProfileImage(
              userCredential.user!.uid, file);

          userModel = UserModel(
              email: email,
              fullname: fullname,
              photoUrl: photoUrl,
              uid: userCredential.user!.uid,
              username: username,
              followers: [],
              following: []);

          await _users.doc(userCredential.user!.uid).set(userModel.toMap());
        } else {
          userModel = await getUserdata(userCredential.user!.uid).first;
        }
        return right(userModel);
      }
      return left(Failure("Validation failed. Please check your input."));
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserdata(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }

  FutureEither<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel = await getUserdata(userCredential.user!.uid).first;
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
