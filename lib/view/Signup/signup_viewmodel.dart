// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  bool obscure = true;
  bool acceptTerms = false;
  bool isLoading = false;

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void toggleTerms(bool value) {
    acceptTerms = value;
    notifyListeners();
  }

  Future<void> signup(BuildContext context) async {
    if (!acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept terms & conditions")),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Signup successful")),
    );

    context.goNamed('home');
  }
}
