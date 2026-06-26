import 'package:chat_sphere_app/Features/Auth/Controllers/auth_controller.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/logo_widget.dart';
import 'package:chat_sphere_app/core/widgets/my_button.dart';
import 'package:chat_sphere_app/core/widgets/my_text_field.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final authController = Get.put(AuthController(), permanent: true);

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace(AppDimensions.appBarHeight),

              // Header
              Center(
                child: Column(
                  children: [
                    LogoWidget(),
                    heightSpace(AppDimensions.spacingMedium),

                    MyTitleText(text: 'Welcome Back'),
                    MyBodyText(text: 'Sign In to continue to ChatSphere'),
                  ],
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

              heightSpace(AppDimensions.spacingSmall),

              MyBodyText(text: 'Password'),
              heightSpace(AppDimensions.spacingSmallest),
              MyTextField(
                controller: passController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Enter your password',
                prefixIconData: Icons.lock_outline_rounded,
              ),

              heightSpace(AppDimensions.spacingLargest),

              Obx(
                () => MyButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await authController
                          .loginUser(
                            email: emailController.text.trim(),
                            password: passController.text.trim(),
                          )
                          .then((value) {
                            if (!mounted) return;
                            context.goNamed(AppRoutes.home);
                          })
                          .onError((error, stackTrace) {});
                    }
                  },
                  isLoading: authController.isLoading.value,
                  label: 'Login',
                ),
              ),

              heightSpace(AppDimensions.spacingSmall),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.forgotPassword);
                    },
                    child: MyBodyText(
                      text: 'Forgot Password?',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),

              heightSpace(AppDimensions.spacingMedium),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  widthSpaceResponsive(context, 0.04),

                  MyBodyText(text: 'or'),

                  widthSpaceResponsive(context, 0.04),
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),

              heightSpace(AppDimensions.spacingMedium),

              MyButton(
                onTap: () {
                  // TODO, Continue with Google
                },
                backgroundColor: Theme.of(context).colorScheme.surface,

                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),

                labelWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login_outlined,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    widthSpace(AppDimensions.spacingSmallest),

                    MyHeadingText(
                      text: 'Continue With Google',
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ],
                ),
                labelColor: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: AppDimensions.screenPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyBodyText(text: 'Don\'t have an account? '),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.register);
              },
              child: MyBodyText(
                text: 'Sign Up',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
