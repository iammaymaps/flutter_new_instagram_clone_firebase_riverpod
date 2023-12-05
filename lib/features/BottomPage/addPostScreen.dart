import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends ConsumerState<AddPostScreen> {
  Uint8List? profileImage;



  @override
  Widget build(BuildContext context) {
    final file = ref.watch(pickedFileProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                // Your Image
                if (file != null)
                  Image.memory(
                    file, // Replace with your image URL
                    height: 300.0,
                    width: 600.0,
                    fit: BoxFit.cover,
                  ),
                // Close Button
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      // Add your close button functionality here
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.blue, // Set the color of the box stroke
                  width: 2.0, // Set the width of the box stroke
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter post titel',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder
                        .none, // Hide the default border of TextField
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 44,
            width: 400,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                ),
              ),
              child: Text(
                "Post",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
