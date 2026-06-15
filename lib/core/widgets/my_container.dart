import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({
    super.key,
    this.padding,
    this.height,
    this.width,
    this.child,
    this.color,
    this.border,
    this.borderRadius,
    this.decorationImage,
    this.shape,
    this.margin,
    this.alignment,
  });

  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final DecorationImage? decorationImage;
  final BoxShape? shape;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? AppDimensions.innerWidgetPadding,
      margin: widget.margin,
      height: widget.height,
      width: widget.width,
      alignment: widget.alignment,
      decoration: BoxDecoration(
        color: widget.color ?? Theme.of(context).colorScheme.surface,
        border:
            widget.border ??
            Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: widget.shape == BoxShape.circle
            ? null
            : widget.borderRadius ?? AppDimensions.borderRadiusMedium,
        image: widget.decorationImage,
        shape: widget.shape ?? BoxShape.rectangle,
      ),
      child: widget.child,
    );
  }
}
