import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/showSnakckBar.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/model/userModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/data/authRepository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.watch(authRepositoryProvider), ref: ref));

final getUserdataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository authRepository;
  final Ref ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  }) : super(false);

  Stream<User?> get authStateChange => authRepository.authStateChange;

  void signUpWithEmailandPassword(BuildContext context, String email,
      String password, String username, String fullname, Uint8List file) async {
    state = true;
    final user = await authRepository.signUpWithEmailandPassword(
        email: email,
        password: password,
        username: username,
        fullname: fullname,
        file: file);
    state = false;
    user.fold(
        (l) => showSnackbar(context, l.message),
        (userModel) =>
            ref.read(userProvider.notifier).update((state) => userModel));
  }

  Stream<UserModel> getUserData(String uid) {
    return authRepository.getUserdata(uid);
  }

  void loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    state = true;
    final user =
        await authRepository.loginUser(email: email, password: password);
    state = false;
    user.fold(
        (l) => showSnackbar(context, l.message),
        (userModel) =>
            ref.read(userProvider.notifier).update((state) => userModel));
  }
}
