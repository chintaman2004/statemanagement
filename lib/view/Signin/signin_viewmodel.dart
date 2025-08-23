// lib/view/Signin/signin_viewmodel.dart
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _obscure = true;
  bool get obscure => _obscure;

  bool? get rememberMe => null;

  ValueChanged<bool?>? get toggleRememberMe => null;

  void toggleObscure() {
    _obscure = !_obscure;
    notifyListeners();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }
}
