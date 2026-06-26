import 'package:chat_sphere_app/Features/Profile/Screens/profile_screen.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/features/Auth/Screens/forgot_password_screen.dart';
import 'package:chat_sphere_app/features/Auth/Screens/login_screen.dart';
import 'package:chat_sphere_app/features/Auth/Screens/register_screen.dart';
import 'package:chat_sphere_app/features/Auth/Screens/verify_email_screen.dart';
import 'package:chat_sphere_app/features/home/Screens/chat_screen.dart';
import 'package:chat_sphere_app/features/home/Screens/home_screen.dart';
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

    GoRoute(
      path: '/chat',
      name: AppRoutes.chatScreen,
      builder: (context, state) => ChatScreen(),
    ),

    GoRoute(
      path: '/profile',
      name: AppRoutes.profile,
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);
