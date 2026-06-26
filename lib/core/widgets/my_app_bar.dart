import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
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
    this.titleWidget,
    this.actions,
  });

  final Color? backgroundColor;
  final bool isBack;
  final String? title;
  final Widget? titleWidget;
  final bool centerTitle;
  final List<Widget>? actions;

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
          ? GestureDetector(
              onTap: () {
                context.pop();
              },
              child: MyContainer(
                margin: EdgeInsets.only(top: 2, left: 12),
                padding: EdgeInsets.all(8),
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
                noBorder: true,
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            )
          : null,

      title: widget.title != null
          ? MyTitleText(text: widget.title ?? '')
          : widget.titleWidget,

      centerTitle: widget.centerTitle,

      actions: widget.actions,
    );
  }
}
