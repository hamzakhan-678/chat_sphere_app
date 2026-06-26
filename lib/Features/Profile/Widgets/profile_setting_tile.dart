import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:flutter/material.dart';

class ProfileSettingTile extends StatelessWidget {
  const ProfileSettingTile({
    super.key,
    required this.leadingIconData,
    required this.title,
    this.trailingForwardIcon = false,
    this.trailingWidget,
  });

  final IconData leadingIconData;
  final String title;
  final bool trailingForwardIcon;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 12,
      leading: MyContainer(
        shape: BoxShape.circle,
        padding: EdgeInsets.all(6),
        noBorder: true,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Icon(
          leadingIconData,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),

      title: MyHeadingText(text: title),

      trailing: trailingForwardIcon
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            )
          : trailingWidget,
    );
  }
}
