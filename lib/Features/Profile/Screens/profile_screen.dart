import 'dart:io';
import 'package:chat_sphere_app/Features/Auth/Controllers/auth_controller.dart';
import 'package:chat_sphere_app/Features/Profile/Controllers/theme_controller.dart';
import 'package:chat_sphere_app/Features/Profile/Widgets/image_container.dart';
import 'package:chat_sphere_app/Features/Profile/Widgets/profile_setting_tile.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_colors.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/helper_class.dart';
import 'package:chat_sphere_app/core/widgets/my_app_bar.dart';
import 'package:chat_sphere_app/core/widgets/my_button.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authController = Get.find<AuthController>();
  final themeController = Get.find<ThemeController>();

  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isBack: true, title: 'Profile', centerTitle: true),
      body: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Center(
              child: GestureDetector(
                onTap: () async {
                  await HelperClass.pickImage(context: context).then((
                    fileImage,
                  ) {
                    if (fileImage != null) {
                      profileImage = fileImage;
                      setState(() {});
                    }
                  });
                },
                child: profileImage != null
                    ? ImageContainer(
                        size: 100,
                        fileImage: profileImage,
                        editIcon: true,
                      )
                    : ImageContainer(
                        size: 100,
                        assetUrl: 'assets/avatar-me.png',
                        editIcon: true,
                      ),
              ),
            ),

            heightSpace(AppDimensions.spacingSmall),

            Center(
              child: Obx(
                () => MyHeadingText(
                  text: authController.userModel.value.name ?? 'Name not found',
                ),
              ),
            ),

            Center(
              child: Obx(
                () => MyBodyText(
                  text:
                      authController.userModel.value.email ?? 'Email not found',
                ),
              ),
            ),

            heightSpace(AppDimensions.spacingLarge),

            MyContainer(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              borderRadius: BorderRadius.circular(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSettingTile(
                    leadingIconData: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    trailingWidget: Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (value) async {
                        await themeController.toggleTheme();
                        setState(() {});
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: ProfileSettingTile(
                      leadingIconData: Icons.notifications_none_rounded,
                      title: 'Notifications',
                      trailingForwardIcon: true,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Divider(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: ProfileSettingTile(
                      leadingIconData: Icons.verified_user_outlined,
                      title: 'Privacy & Security',
                      trailingForwardIcon: true,
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            MyButton(
              onTap: () {
                // TODO: Edit Profile
              },
              label: 'Edit Profile',
            ),

            heightSpace(AppDimensions.spacingSmall),

            Obx(
              () => MyButton(
                onTap: () async {
                  final success = await authController.logoutUser();
                  if (success) {
                    if (!mounted) return;
                    context.goNamed(AppRoutes.login);
                  }
                },
                backgroundColor: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: themeController.isDarkMode.value
                      ? Theme.of(context).colorScheme.outline
                      : AppColors.error,
                ),
                isLoading: authController.isLoading.value,
                labelWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_outlined, color: AppColors.error),

                    widthSpace(AppDimensions.spacingSmallest),

                    MyHeadingText(text: 'Logout', color: AppColors.error),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
