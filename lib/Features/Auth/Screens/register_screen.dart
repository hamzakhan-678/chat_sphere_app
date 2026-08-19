import 'package:chat_sphere_app/Features/Auth/Controllers/auth_controller.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_app_bar.dart';
import 'package:chat_sphere_app/core/widgets/my_button.dart';
import 'package:chat_sphere_app/core/widgets/my_custom_dialogs.dart';
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
        padding: AppDimensions.scaffoldPadding,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTitleText(text: 'Create Account'),
              MyBodyText(text: 'Join ChatSphere and start connecting'),

              height(AppDimensions.l),

              MyBodyText(text: 'Full Name'),
              height(AppDimensions.xs),
              MyTextField(
                controller: fullNameController,
                hintText: 'Full Name',
                keyboardType: TextInputType.text,
                prefixIconData: Icons.person_outline_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),

              height(AppDimensions.s),

              MyBodyText(text: 'Email'),
              height(AppDimensions.xs),
              MyTextField(
                controller: emailController,
                hintText: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
                prefixIconData: Icons.mail_outline_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),

              height(AppDimensions.s),

              MyBodyText(text: 'Password'),
              height(AppDimensions.xs),
              MyTextField(
                controller: passwordController,
                hintText: 'Create a password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                prefixIconData: Icons.lock_outline_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),

              height(AppDimensions.s),

              MyBodyText(text: 'Confirm Password'),
              height(AppDimensions.xs),
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Re-enter your password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                prefixIconData: Icons.verified_user_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password is required';
                  }
                  if (confirmPasswordController.text.trim() !=
                      passwordController.text.trim()) {
                    return 'Password doesn\'t match';
                  }
                  return null;
                },
              ),

              height(AppDimensions.l),

              MyButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      myLoadingDialog(
                        context,
                        title: 'Creating your account...',
                      );

                      await authController.registerUser(
                        fullName: fullNameController.text.trim(),
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (!context.mounted) return;

                      context.pop();
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return CustomSuccessDialog(
                            title: 'Success!',
                            subtitle:
                                'Your account has been created. Please login to continue using your account',
                            onTap: () {
                              context.pushNamed(AppRoutes.login);
                            },
                          );
                        },
                      );
                    } catch (e) {
                      if (!context.mounted) return;

                      context.pop();
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return CustomSuccessDialog(
                            title: 'Error',
                            subtitle: e.toString(),
                            onTap: () {},
                          );
                        },
                      );
                    }
                  }
                },
                // isLoading: authController.isLoading.value,
                label: 'Sign Up',
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: AppDimensions.scaffoldPadding,
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
