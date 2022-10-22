import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/screens/home/home_screen.dart';
import 'package:quizz_app/screens/login/login_screen.dart';
import 'package:quizz_app/screens/signup/signup_screen.dart';
import 'package:quizz_app/utils/app_theme.dart';

import 'controllers/auth/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authProvider);
    Widget getHome() {
      if (authenticationState.status == AuthenticationStatus.authenticated) {
        return const HomeScreen();
      } else if (authenticationState.status ==
          AuthenticationStatus.unauthenticated) {
        return const SignUpScreen();
      } else {
        return const LoginScreen();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz app',
      theme: Apptheme.lightTheme,
      home: getHome(),
    );
  }
}
