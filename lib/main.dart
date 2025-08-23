import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view/wishlist/wishlist_viewmodel.dart';
import 'core/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WishlistViewModel()),
      ],
      child: const RealEstateApp(),
    ),
  );
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate App',
      theme: ThemeData(primarySwatch: Colors.purple),
      routerConfig: AppRouter.router,
    );
  }
}
