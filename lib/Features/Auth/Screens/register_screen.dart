import 'package:chat_sphere_app/Features/Auth/Controllers/auth_controller.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_app_bar.dart';
import 'package:chat_sphere_app/core/widgets/my_button.dart';
import 'package:chat_sphere_app/core/widgets/my_text_field.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final authController = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isBack: true),
      body: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTitleText(text: 'Create Account'),
              MyBodyText(text: 'Join ChatSphere and start connecting'),

              heightSpace(AppDimensions.spacingLarge),

              MyBodyText(text: 'Full Name'),
              heightSpace(AppDimensions.spacingSmallest),
              MyTextField(
                controller: fullNameController,
                hintText: 'Full Name',
                keyboardType: TextInputType.text,
                prefixIconData: Icons.person_outline_rounded,
              ),

              heightSpace(AppDimensions.spacingSmall),

              MyBodyText(text: 'Email'),
              heightSpace(AppDimensions.spacingSmallest),
              MyTextField(
                controller: emailController,
                hintText: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
                prefixIconData: Icons.mail_outline_rounded,
              ),

              heightSpace(AppDimensions.spacingSmall),

              MyBodyText(text: 'Password'),
              heightSpace(AppDimensions.spacingSmallest),
              MyTextField(
                controller: passwordController,
                hintText: 'Create a password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                prefixIconData: Icons.lock_outline_rounded,
              ),

              heightSpace(AppDimensions.spacingSmall),

              MyBodyText(text: 'Confirm Password'),
              heightSpace(AppDimensions.spacingSmallest),
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Re-enter your password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                prefixIconData: Icons.verified_user_outlined,
              ),

              heightSpace(AppDimensions.spacingLargest),

              Obx(
                () => MyButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await authController
                          .registerUser(
                            fullName: fullNameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          )
                          .then((value) {
                            if (!mounted) return;
                            context.pushNamed(AppRoutes.login);
                          })
                          .onError((error, stackTrace) {});
                    }
                  },
                  isLoading: authController.isLoading.value,
                  label: 'Sign Up',
                ),
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
            MyBodyText(text: 'Already have an account? '),
            GestureDetector(
              onTap: () {
                context.goNamed(AppRoutes.login);
              },
              child: MyBodyText(
                text: 'Login',
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
