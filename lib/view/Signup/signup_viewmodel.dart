import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app/core/app_routes.dart';

class SignupViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  ValueChanged<String>? get setEmail => null;

  ValueChanged<String>? get setPassword => null;

  ValueChanged<String>? get setConfirmPassword => null;

  Future<void> signup(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")),
        );
      }
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(), // ✅ always String
        password: passwordController.text.trim(), // ✅ always String
      );

      if (context.mounted) {
        Navigator.pushReplacementNamed(
            context, AppRouter.home); // ✅ String not nullable
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Signup failed")),
        );
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
