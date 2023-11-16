import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/domain/authController.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/widgets/authTextFiled.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/theme/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Loader.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginUser() {
    ref.read(authControllerProvider.notifier).loginUser(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
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
            : Column(
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
                    height: 100,
                  ),
                  Image.asset(
                    "assets/images/instagram logo.png",
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  AuthTextFiled(
                      hintText: 'Username, email or mobile number',
                      inputController: _emailController),
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
                        onPressed: loginUser,
                        child: Text(
                          "Login",
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
                    height: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          context.go('/Signup');
                        },
                        child: Text(
                          "Create new account",
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
              ));
  }
}
