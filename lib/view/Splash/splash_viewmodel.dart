import 'dart:async';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  Future<void> init(BuildContext context) async {
// Simulate small delay then navigate to SignIn
    unawaited(Future<void>.delayed(const Duration(milliseconds: 1200), () {
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed('/signin');
      }
    }));
  }
}
