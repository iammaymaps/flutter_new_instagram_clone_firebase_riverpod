import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/pages/loginPage.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/pages/signUppage.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/navigation/routerContastant.dart';
import 'package:go_router/go_router.dart';

// final loggedInRoute = GoRouter(routes: [
//   GoRoute(
//       path: '/',
//       pageBuilder: (context, state) {
//         return CustomTransitionPage(
//             key: state.pageKey,
//             child: HomeFeed(),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//                 child: child,
//               );
//             });
//       }),
//   GoRoute(
//       path: '/shortProjects',
//       pageBuilder: (context, state) {
//         return CustomTransitionPage(
//             key: state.pageKey,
//             child: ShortProjectsScreen(),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//                 child: child,
//               );
//             });
//       }),
//   GoRoute(
//       path: '/longProjects',
//       pageBuilder: (context, state) {
//         return CustomTransitionPage(
//             key: state.pageKey,
//             child: LongProjectsScreen(),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//                 child: child,
//               );
//             });
//       }),
//   GoRoute(
//       path: '/profile',
//       pageBuilder: (context, state) {
//         return CustomTransitionPage(
//             key: state.pageKey,
//             child: ProfileScreen(),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
//                 child: child,
//               );
//             });
//       }),
// ]);

final loggedOutRoute = GoRouter(routes: [
  GoRoute(
      name: RoutesConstants.loginPage,
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: LoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
  GoRoute(
      name: RoutesConstants.SignUpPage,
      path: '/Signup',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: SignUpPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
]);
