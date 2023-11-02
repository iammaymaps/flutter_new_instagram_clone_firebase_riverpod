import 'package:flutter/material.dart';

class AuthTextFiled extends StatelessWidget {
  const AuthTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFB0B0B0)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Username, email or mobile number',
              hintStyle:
                  TextStyle(fontFamily: 'Mitr', color: Color(0xFFB0B0B0)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
