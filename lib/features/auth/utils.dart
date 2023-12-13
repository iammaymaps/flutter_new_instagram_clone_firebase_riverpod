import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/Failure.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/typedef.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

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

  FutureEither<String?> uploadProfileImage(String uid, Uint8List file) async {
    try {
      final Reference reference =
          firebaseStorage.ref().child('profile_images/$uid.jpg');
      UploadTask uploadTask = reference.putData(file);
      String location = await (await uploadTask).ref.getDownloadURL();
      return right(location);
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
    } else {
      print("How can I");
    }
  }
}

final pickedFileProvider =
    StateNotifierProvider<PickedFileNotifier, Uint8List?>(
        (ref) => PickedFileNotifier());

final postStorageRepositoryProvider = Provider(
    (ref) => PostStorageRepository(firebaseStorage: FirebaseStorage.instance));

class PostStorageRepository {
  final FirebaseStorage _firebaseStorage;

  PostStorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile({
    required String path,
    required String ID,
    required Uint8List? file,
  }) async {
    try {
      final Reference reference =
          _firebaseStorage.ref().child('post_images/$ID.png');
      UploadTask uploadTask = reference.putData(file!);
      final snapshot = await uploadTask;

      return right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      print("How can I$e");
      return left(Failure(e.toString()));
    }
  }
}
