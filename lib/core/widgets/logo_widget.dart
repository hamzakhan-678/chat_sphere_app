import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key, this.size = 70});

  final double size;

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      padding: AppDimensions.containerPadding,
      height: widget.size,
      width: widget.size,
      noBorder: true,
      color: Theme.of(context).colorScheme.primary,
      child: Icon(
        LucideIcons.messageCircle,
        size: AppDimensions.iconLg,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
