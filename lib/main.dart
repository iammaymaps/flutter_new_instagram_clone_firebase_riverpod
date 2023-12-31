import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/HomeScreen.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/Loader.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/domain/authController.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/errorText.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/pages/loginPage.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/pages/signUppage.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/showSnakckBar.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/firebase_options.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/model/userModel.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/navigation/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef widgetRef, User data) async {
    try {
      userModel = await widgetRef
          .watch(authControllerProvider.notifier)
          .getUserData(data.uid)
          .first;

      // Check if userModel is not null and is a valid map before updating state
      if (userModel != null && userModel is Map<String, dynamic>) {
        ref.read(userProvider.notifier).update((state) => userModel);
        setState(() {});
      } else {
        // Handle the case when userModel is null or not a valid map
        print("User data is null or not a valid map");
      }
    } catch (error, stackTrace) {
      // Handle the error, log it, or show an error message
      print("Error fetching user data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Set overall background color
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );

    //   ref.watch(authStateChangeProvider).when(
    //       data: (data) {
    //         if (data != null) {
    //           getData(ref, data);
    //           if (userModel != null) {
    //             return MaterialApp.router(
    //               theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    //               debugShowCheckedModeBanner: false,
    //               routerConfig: loggedInRoute,
    //             );
    //           }
    //         }
    //         return MaterialApp.router(
    //           theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    //           debugShowCheckedModeBanner: false,
    //           routerConfig: loggedOutRoute,
    //         );
    //       },
    //       error: (error, StackTrace) => ErrorText(error: error.toString()),
    //       loading: () => const Loader());
  }
}
