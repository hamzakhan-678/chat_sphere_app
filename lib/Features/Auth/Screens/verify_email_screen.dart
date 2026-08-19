import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:chat_sphere_app/core/widgets/my_app_bar.dart';
import 'package:chat_sphere_app/core/widgets/my_button.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isBack: true),
      body: Padding(
        padding: AppDimensions.scaffoldPadding,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              height(AppDimensions.appBarHeight),

              // Mail Icon -- Outer Container
              MyContainer(
                padding: EdgeInsets.all(16),
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent),

                // Middle Container
                child: MyContainer(
                  padding: EdgeInsets.all(6),
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent),

                  // Inner Container
                  child: MyContainer(
                    padding: EdgeInsets.all(16),
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent),
                    child: Icon(
                      LucideIcons.mailCheck,
                      size: AppDimensions.iconLg,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),

              height(AppDimensions.s),

              MyTitleText(text: 'Verify your email'),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.1,
                ),
                child: MyBodyText(
                  text:
                      'We sent a verification link to your inbox. Open it to activate your ChatSphere account.',
                  textAlign: TextAlign.center,
                ),
              ),

              Spacer(),

              MyButton(
                onTap: () {
                  context.pushNamed(AppRoutes.home);
                  // TODO: context.goNamed(AppRoutes.home);
                },
                label: 'I\'ve verified - Refresh',
              ),

              height(AppDimensions.s),

              MyButton(
                onTap: () {
                  //TODO:
                  // Get.snackbar(
                  //   'Email Sent!',
                  //   'We sent a verification link to your email.',
                  //   duration: const Duration(seconds: 3),
                  // ).show();
                },
                label: 'Resend Email',
                backgroundColor: Theme.of(context).colorScheme.surface,
                labelColor: Theme.of(context).colorScheme.onSurface,
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),

              height(AppDimensions.l),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyBodyText(text: 'Wrong address? '),
                  GestureDetector(
                    onTap: () {
                      context.goNamed(AppRoutes.register);
                    },
                    child: MyBodyText(
                      text: 'Change Email',
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
