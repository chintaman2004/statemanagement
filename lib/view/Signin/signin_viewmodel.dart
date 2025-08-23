import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool obscure = true;
  bool rememberMe = false; // ✅ initialized to false

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void toggleRememberMe(bool? val) {
    rememberMe = val ?? false; // ✅ null-safe
    notifyListeners();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }
}
