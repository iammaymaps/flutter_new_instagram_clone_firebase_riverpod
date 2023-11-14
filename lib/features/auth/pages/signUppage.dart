import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/Loader.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/domain/authController.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/utils.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/widgets/authTextFiled.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/theme/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  Uint8List? profileImage;

  void selectProfileImage() async {
    final bytes = await pickImage();
    if (bytes != null) {
      setState(() {
        profileImage = bytes;
      });
    }
  }

  void createUserWithEmailandPassword() {
    if (profileImage != null) {
      ref.read(authControllerProvider.notifier).signUpWithEmailandPassword(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _usernameController.text.trim(),
          _nameController.text.trim(),
          profileImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    TextStyle hintTextStyle = GoogleFonts.mitr(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
    return Scaffold(
        backgroundColor: loginScreenbackgound,
        body: isLoading
            ? Loader()
            : SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'English(US)',
                      style: GoogleFonts.mitr(),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      profileImage != null
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage: MemoryImage(profileImage!),
                            )
                          : const CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                  'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'),
                            ),
                      Positioned(
                          bottom: -5,
                          left: 100,
                          child: IconButton(
                            icon: const Icon(
                              Icons.photo_camera_rounded,
                              size: 30,
                            ),
                            onPressed: selectProfileImage,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  AuthTextFiled(
                      hintText: 'Full name', inputController: _nameController),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextFiled(
                      hintText: 'Username',
                      inputController: _usernameController),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextFiled(
                      hintText: 'Email', inputController: _emailController),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextFiled(
                      hintText: 'Password',
                      inputController: _passwordController),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                        onPressed: createUserWithEmailandPassword,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.mitr(),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000)),
                          backgroundColor: loginButtoncolor,
                          minimumSize: Size(
                            double.infinity,
                            60,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.mitr(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          context.go('/');
                        },
                        child: Text(
                          "Login to your account",
                          style: GoogleFonts.mitr(color: loginButtoncolor),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  width: 1, color: loginButtoncolor)),
                          backgroundColor: loginScreenbackgound,
                          foregroundColor: loginScreenbackgound,
                          minimumSize: Size(
                            double.infinity,
                            60,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/meta logo.png",
                    height: 90,
                    width: 90,
                  )
                ],
              )));
  }
}
