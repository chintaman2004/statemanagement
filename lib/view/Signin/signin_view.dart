import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/view/home/home_view.dart'; // ✅ Import HomeView
import 'package:real_estate_app/view/signup/signup_view.dart';
import 'signin_viewmodel.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
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
                              hintText: "andrew_ainsley@yourdomain.com",
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
                          const SizedBox(height: 10),

                          // Remember Me and Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: vm.rememberMe,
                                    onChanged: vm.toggleRememberMe,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  const Text("Remember me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  // Add forgot password logic
                                },
                                child: const Text("Forgot the password?"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Sign In Button
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
                              onPressed: () {
                                debugPrint(
                                  "Email: ${vm.emailCtrl.text}, Pass: ${vm.passCtrl.text}, RememberMe: ${vm.rememberMe}",
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => HomeView(),
                                  ),
                                );
                              },
                              child: const Text("Sign In"),
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

                          // Sign Up Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupView(),
                                    ),
                                  );
                                },
                                child: const Text("Sign up"),
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
