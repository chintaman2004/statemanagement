// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:real_estate_app/view/Signin/signin_view.dart';
import '../view/signin/signin_view.dart' hide SignInView;

class AppRoutes {
  static const signIn = '/signin';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      default:
        return null;
    }
  }
}
