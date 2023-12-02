import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Uint8List?> pickImage() async {
  final result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    return result.files.first.bytes;
  } else {
    // User canceled the picker
    return null;
  }
}

class FirebaseConstants {
  static const usersCollection = 'users';
}

final storageRepositoryProvider = Provider(
    (ref) => StorageRepository(firebaseStorage: FirebaseStorage.instance));

class StorageRepository {
  final FirebaseStorage firebaseStorage;

  StorageRepository({
    required this.firebaseStorage,
  });

  Future<String> uploadProfileImage(String uid, Uint8List file) async {
    try {
      final Reference reference =
          firebaseStorage.ref().child('profile_images/$uid.jpg');
      UploadTask uploadTask = reference.putData(file);
      String location = await (await uploadTask).ref.getDownloadURL();
      return location;
    } catch (e) {
      print('Error uploading profile image: $e');
      throw e;
    }
  }
}

class PickedFileNotifier extends StateNotifier<Uint8List?> {
  PickedFileNotifier() : super(null);

  Future<void> pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      state = result.files.single.bytes;
    }
  }
}

final pickedFileProvider =
    StateNotifierProvider<PickedFileNotifier, Uint8List?>(
        (ref) => PickedFileNotifier());
