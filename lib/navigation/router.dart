import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/BottomPage/HomeScreen.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/pages/loginPage.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/pages/signUppage.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/navigation/routerContastant.dart';
import 'package:go_router/go_router.dart';

final loggedInRoute = GoRouter(routes: [
  GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
]);

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
