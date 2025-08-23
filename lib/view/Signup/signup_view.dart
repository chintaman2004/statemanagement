// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app/view/signin/signin_view.dart';

class SignupViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  bool obscure = true;
  bool obscureConfirm = true;

  void toggleObscure() {
    obscure = !obscure;
    notifyListeners();
  }

  void toggleObscureConfirm() {
    obscureConfirm = !obscureConfirm;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context) async {
    final email = emailCtrl.text.trim();
    final pass = passCtrl.text.trim();
    final confirm = confirmPassCtrl.text.trim();

    if (email.isEmpty || pass.isEmpty || confirm.isEmpty) {
      _showSnack(context, "All fields are required");
      return;
    }

    if (pass != confirm) {
      _showSnack(context, "Passwords do not match");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      _showSnack(context, "Account created successfully!");

      // Navigate back to SignInView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInView()),
      );
    } on FirebaseAuthException catch (e) {
      _showSnack(context, e.message ?? "Signup failed");
    }
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 200),
                // Logo at the top
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 150,
                  ),
                ),
                const SizedBox(height: 100),

                // Form centered below logo
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          // Email Field
                          TextField(
                            controller: vm.emailCtrl,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              hintText: "example@domain.com",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          TextField(
                            controller: vm.passCtrl,
                            obscureText: vm.obscure,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  vm.obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: vm.toggleObscure,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Confirm Password Field
                          TextField(
                            controller: vm.confirmPassCtrl,
                            obscureText: vm.obscureConfirm,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  vm.obscureConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: vm.toggleObscureConfirm,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () => vm.signUp(context),
                              child: const Text("Sign Up"),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Social Login Icons
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook,
                                  size: 32, color: Colors.blue),
                              SizedBox(width: 24),
                              Icon(Icons.g_mobiledata,
                                  size: 32, color: Colors.red),
                              SizedBox(width: 24),
                              Icon(Icons.apple, size: 32, color: Colors.black),
                            ],
                          ),
                          const SizedBox(height: 30),

                          // Already have account? Login
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignInView(),
                                    ),
                                  );
                                },
                                child: const Text("Sign in"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
