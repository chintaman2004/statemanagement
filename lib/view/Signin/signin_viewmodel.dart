import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/Services/firebase_auth_service.dart';

class SignInViewModel with ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool rememberMe = true;
  bool isBusy = false;
  bool obscure = true;

  void toggleRemember(bool? v) {
    rememberMe = v ?? false;
    notifyListeners();
  }

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    final auth = context.read<FirebaseAuthService>();
    isBusy = true;
    notifyListeners();
    try {
      await auth.signInWithEmail(emailCtrl.text.trim(), passCtrl.text.trim());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signed in successfully.')),
        );
// Navigate to Home (to be implemented in next step)
      }
    } on Exception catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      isBusy = false;
      notifyListeners();
    }
  }

  void disposeControllers() {
    emailCtrl.dispose();
    passCtrl.dispose();
  }
}
