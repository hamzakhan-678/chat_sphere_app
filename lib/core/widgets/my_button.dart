import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.label,
    this.labelColor,
  });

  final void Function()? onTap;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final String? label;
  final Color? labelColor;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? AppDimensions.buttonHeight,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color:
              widget.backgroundColor ?? Theme.of(context).colorScheme.primary,
          border: widget.border,
          borderRadius: widget.borderRadius ?? AppDimensions.borderRadiusFull,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.label != null
                ? MyHeadingText(
                    text: widget.label ?? '',
                    color: widget.labelColor,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
