import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/features/auth/view/login_screen.dart';
import 'package:chat_sphere_app/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: AppRoutes.login,
      builder: (context, state) => LoginScreen(),
    ),
  ],
);
