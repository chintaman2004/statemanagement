import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool obscure = true; // ✅ non-nullable

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  Future<bool> signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );
      return true; // ✅ signup successful
    } on FirebaseAuthException catch (e) {
      debugPrint("Signup Error: ${e.message}");
      return false;
    }
  }
}
