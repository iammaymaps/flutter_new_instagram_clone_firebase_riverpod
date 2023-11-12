// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_new_instagram_clone_firebase_riverpod/error%20handle/typedef.dart';
// import 'package:flutter_new_instagram_clone_firebase_riverpod/model/userModel.dart';

// class AuthRepository {
//   final FirebaseAuth firebaseAuth;
//   final FirebaseFirestore firestore;
//   AuthRepository({
//     required this.firebaseAuth,
//     required this.firestore,
//   });

//   FutureEither<UserModel> signUpWithEmailandPassword(
//       {required String email,
//       required String password,
//       required String username,
//       required String fullname,
//       required Uint8List file}) async {
//     try {
//       if (email.isNotEmpty ||
//           password.isNotEmpty ||
//           username.isNotEmpty ||
//           fullname.isNotEmpty ||
//           file != null) {
//         UserCredential userCredential = await firebaseAuth
//             .createUserWithEmailAndPassword(email: email, password: password);

//         UserModel userModel;
//         if (userCredential.additionalUserInfo!.isNewUser) {
//           userModel = UserModel(
//               email: email,
//               fullname: fullname,
//               photoUrl: photoUrl,
//               uid : userCredential.user!.uid,
//               username: username,
//               followers: [],
//               following: []);
//         }
//       }
//     } catch (e) {}
//   }
// }
