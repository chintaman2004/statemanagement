import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/app_routes.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
      child: const _SplashScaffold(),
    );
  }
}

class _SplashScaffold extends StatefulWidget {
  const _SplashScaffold();

  @override
  State<_SplashScaffold> createState() => _SplashScaffoldState();
}

class _SplashScaffoldState extends State<_SplashScaffold> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, AppRouter.signin);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
