// lib/screens/auth/signin/signin_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'signin_viewmodel.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: const _SignInScaffold(),
    );
  }
}

class _SignInScaffold extends StatelessWidget {
  const _SignInScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SignInViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const SizedBox(height: 8),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F5FF),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: vm.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'your@email.com',
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: vm.passCtrl,
                obscureText: vm.obscure,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: vm.toggleObscure,
                    icon: Icon(
                        vm.obscure ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // ⬇️ GoRouter navigation to the named 'home' route
                  onPressed: () => context.goNamed('home'),
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    // ⬇️ GoRouter push to 'signup'
                    onPressed: () => context.pushNamed('signup'),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
