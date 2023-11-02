import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/widgets/authTextFiled.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/theme/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
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
            height: 30,
          ),
          AuthTextFiled()
        ],
      ),
    );
  }
}
