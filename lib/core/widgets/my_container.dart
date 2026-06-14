import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({super.key, this.padding, this.height, this.width});

  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? AppDimensions.innerWidgetPadding,
      height: widget.height,
      width: widget.width,
    );
  }
}
