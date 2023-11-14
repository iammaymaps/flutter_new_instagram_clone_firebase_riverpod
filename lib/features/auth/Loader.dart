import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 150.0, // Set the desired width
            height: 150.0, // Set the desired height
            child: CircularProgressIndicator(
              value:
                  null, // Set to null to use the default size based on the theme
              strokeWidth: 7.0, // Set the desired stroke width
            ),
          ),
        ),
      ],
    );
  }
}
