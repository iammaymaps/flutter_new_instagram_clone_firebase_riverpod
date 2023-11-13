import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/showSnakckBar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/data/authRepository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.watch(authRepositoryProvider), ref: ref));

class AuthController extends StateNotifier<bool> {
  final AuthRepository authRepository;
  final Ref ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  }) : super(false);

  void signUpWithEmailandPassword(
      BuildContext context,
      String email,
      String password,
      String username,
      String fullname,
      Uint8List file) async {
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
        (userModel) => showSnackbar(context,
            "Congratulations on successfully signing up! You have now taken the first step towards achieving your academic goal"));
  }
}
