import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:chat_sphere_app/core/widgets/my_app_bar.dart';
import 'package:chat_sphere_app/core/widgets/my_button.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_field.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isBack: true),
      body: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace(AppDimensions.appBarHeight),
            Center(
              child: MyContainer(
                padding: EdgeInsets.all(16),
                shape: BoxShape.circle,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.2),
                border: Border.all(color: Colors.transparent),
                child: Icon(
                  LucideIcons.key,
                  color: Theme.of(context).colorScheme.primary,
                  size: AppDimensions.iconLg,
                ),
              ),
            ),

            heightSpace(AppDimensions.spacingSmall),

            Center(child: MyTitleText(text: 'Forgot Password?')),

            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.1,
                ),
                child: MyBodyText(
                  text:
                      'Enter your email and we\'ll send you a link to reset your password.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            heightSpace(AppDimensions.spacingLarge),

            MyBodyText(text: 'Email'),
            heightSpace(AppDimensions.spacingSmallest),
            MyTextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'you@example.com',
              prefixIconData: Icons.mail_outline_rounded,
            ),

            heightSpace(AppDimensions.spacingLargest),

            MyButton(
              onTap: () {
                context.goNamed(AppRoutes.login);
              },
              label: 'Send Reset Link',
            ),
          ],
        ),
      ),
    );
  }
}
