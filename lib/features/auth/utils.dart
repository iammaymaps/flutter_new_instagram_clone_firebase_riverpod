import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}
Future<Uint8List?> pickImage() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    return result.files.first.bytes;
  } else {
    // User canceled the picker
    return null;
  }
}

