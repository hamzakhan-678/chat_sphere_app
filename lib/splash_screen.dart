import 'package:chat_sphere_app/Features/Auth/Controllers/auth_controller.dart';
import 'package:chat_sphere_app/Features/Auth/Models/user_model.dart';
import 'package:chat_sphere_app/Features/Profile/Controllers/theme_controller.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:chat_sphere_app/core/widgets/logo_widget.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(AuthController());
  final themeController = Get.find<ThemeController>();

  Future myInit() async {
    // Getting Theme from Cache
    themeController.getCurrentThemeFromMemory();

    // Getting User from Cache
    final user = authController.box.read(authController.userKey);

    if (user != null) {
      debugPrint('Current User: $user');
      authController.userModel.value = UserModel.fromJson(user);

      if (!mounted) return;
      context.goNamed(AppRoutes.home);
    } else {
      if (!mounted) return;
      context.goNamed(AppRoutes.login);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      myInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoWidget(),

            height(AppDimensions.m),

            MyTitleText(text: 'ChatSphere'),

            height(AppDimensions.s),

            MyBodyText(text: 'Conversations, beautifully connected.'),

            height(AppDimensions.m),

            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              strokeWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}
