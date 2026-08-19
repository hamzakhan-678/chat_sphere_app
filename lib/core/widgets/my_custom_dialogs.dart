import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';

class CustomSuccessDialog extends StatelessWidget {
  const CustomSuccessDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required Null Function() onTap,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: MyTitleText(text: title)),

            height(AppDimensions.s),

            Center(
              child: MyHeadingText(text: subtitle, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}

Future myLoadingDialog(BuildContext context, {String? title}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return CustomLoadingDialog();
    },
  );
}

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 2,
                ),

                width(screenWidth(context) * 0.04),

                Expanded(child: MyHeadingText(text: title ?? 'Loading...')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
