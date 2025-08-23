import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.signin);
    }
  }
}
