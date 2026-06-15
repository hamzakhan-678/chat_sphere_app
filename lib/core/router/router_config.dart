import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/features/auth/view/forgot_password_screen.dart';
import 'package:chat_sphere_app/features/auth/view/login_screen.dart';
import 'package:chat_sphere_app/features/auth/view/register_screen.dart';
import 'package:chat_sphere_app/features/auth/view/verify_email_screen.dart';
import 'package:chat_sphere_app/features/home/view/screens/home_screen.dart';
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

    GoRoute(
      path: '/register',
      name: AppRoutes.register,
      builder: (context, state) => RegisterScreen(),
    ),

    GoRoute(
      path: '/forgot-password',
      name: AppRoutes.forgotPassword,
      builder: (context, state) => ForgotPasswordScreen(),
    ),

    GoRoute(
      path: '/verify-email',
      name: AppRoutes.verifyEmail,
      builder: (context, state) => VerifyEmailScreen(),
    ),

    GoRoute(
      path: '/home',
      name: AppRoutes.home,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
