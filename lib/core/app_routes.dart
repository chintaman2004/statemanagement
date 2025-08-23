import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item_model.dart';
import '../view/signin/signin_view.dart';
import '../view/signup/signup_view.dart';
import '../view/Home/home_view.dart';
import '../view/Detail/detail_view.dart';
import '../view/wishlist/wishlist_view.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/signin',
    routes: [
      GoRoute(
        path: '/signin',
        name: 'signin',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/wishlist',
        name: 'wishlist',
        builder: (context, state) => const WishlistView(),
      ),
      GoRoute(
        path: '/details',
        name: 'details',
        builder: (context, state) {
          final item = state.extra as ItemModel;
          return DetailsView(item: item);
        },
      ),
    ],
  );

  static String get home => '/home';

  static String get signin => '/signin';
}
