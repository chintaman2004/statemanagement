import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signup_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Signup"),
              backgroundColor: Colors.deepPurple,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: viewModel.setEmail,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: viewModel.setPassword,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: viewModel.setConfirmPassword,
                  ),
                  const SizedBox(height: 24),
                  viewModel.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: () => viewModel.signup(context),
                          child: const Text(
                            "Signup",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
