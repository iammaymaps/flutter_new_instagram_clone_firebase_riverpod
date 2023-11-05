import 'package:flutter/material.dart';

class AuthTextFiled extends StatelessWidget {
  const AuthTextFiled({
    Key? key,
    required this.hintText,
    required this.inputController,
  }) : super(key: key);

  final String hintText;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFB0B0B0)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: TextField(
            controller: inputController,
            decoration: InputDecoration(
              hintText: hintText,
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
