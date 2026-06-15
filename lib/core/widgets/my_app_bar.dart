import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.isBack = false,
    this.title,
    this.centerTitle = true,
  });

  final Color? backgroundColor;
  final bool isBack;
  final String? title;
  final bool centerTitle;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppDimensions.appBarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      leading: widget.isBack
          ? Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            )
          : null,

      title: widget.title != null
          ? MyTitleText(text: widget.title ?? '')
          : null,

      centerTitle: widget.centerTitle,
    );
  }
}
