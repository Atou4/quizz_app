import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/admin/admin_bottomnav.dart';
import 'package:quizz_app/views/auth/login/login_screen.dart';
import 'package:quizz_app/utils/app_theme.dart';
import 'package:quizz_app/views/client/bottomnav_bar.dart';
import 'package:quizz_app/views/select_user.dart';
import 'package:quizz_app/widgets/loading/loading_error.dart';

import 'firebase_options.dart';
import 'controllers/auth/auth_controller.dart';
import 'providers/loading/loading_provider.dart';

import 'package:responsive_framework/responsive_framework.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authProvider);

    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Quizz app',
      theme: Apptheme.lightTheme, 
      home: Consumer(builder: (context, ref, child) {
        ref.listen<bool>(
          isLoadingProvider,
          (_, isLoading) {
            debugPrint(isLoading.toString());
            if (isLoading) {
              Loadingsc.show(context);
            } else {
              Loadingsc.hide(context);
            }
          },
        );
        if (authenticationState.status == AuthenticationStatus.authenticated) {
          return Botnavbar();
        } else if (authenticationState.status ==
            AuthenticationStatus.unauthenticated) {
          return  Botnavbar();
        } else {
          return const LoginScreen();
        }
      }),
    );
  }
}
