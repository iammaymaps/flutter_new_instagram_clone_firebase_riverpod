import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    TextStyle hintTextStyle = GoogleFonts.mitr(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
    return Scaffold(
      backgroundColor: loginScreenbackgound,
      body: Column(
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
          Image.asset(
            "assets/images/instagram logo.png",
            height: 60,
            width: 60,
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
              hintText: 'Username', inputController: _usernameController),
          const SizedBox(
            height: 20,
          ),
          AuthTextFiled(hintText: 'Email', inputController: _emailController),
          const SizedBox(
            height: 20,
          ),
          AuthTextFiled(
              hintText: 'Password', inputController: _passwordController),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                onPressed: () {},
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
                      side: BorderSide(width: 1, color: loginButtoncolor)),
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
      ),
    );
  }
}
