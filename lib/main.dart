import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/Services/firebase_auth_service.dart';
import 'package:real_estate_app/view/Splash/splash_view.dart';
import 'core/app_theme.dart';
import 'core/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Uncomment after adding firebase_options.dart via FlutterFire CLI
// await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(create: (_) => FirebaseAuthService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Real Estate',
          theme: AppTheme.light,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: const SplashView()),
    );
  }
}
