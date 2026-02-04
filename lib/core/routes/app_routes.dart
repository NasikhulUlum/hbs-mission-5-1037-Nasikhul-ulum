import 'package:flutter/material.dart';
import '../../features/onboarding/pages/auth_page.dart';
import '../../features/onboarding/pages/register_page.dart';
import '../../features/onboarding/pages/splash_page.dart';
import '../../features/onboarding/pages/next_page.dart';
import '../../features/onboarding/pages/user_pages/home_page.dart';
import '../../features/onboarding/pages/user_pages/destination_detail_page.dart';


class AppRoutes {
  static const splash = '/';
  static const next = '/next';
  static const auth = '/auth';
  static const register = '/register';
  static const home = '/home';
  static const detail = '/detail';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashPage(),
    next: (_) => const NextPage(),
    auth: (_) => const AuthPage(),
    register: (_) => const RegisterPage(),
    home: (_) => const HomePage(),
    detail: (_) => const DestinationDetailPage()
  };
}
