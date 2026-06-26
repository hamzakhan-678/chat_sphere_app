import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
    this.cursorHeight,
    this.cursorColor,
    this.cursorErrorColor,
    this.onTapOutside,
    this.readOnly = false,
    this.filled = true,
    this.fillColor,
    this.border,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.hintText,
    this.style,
    this.hintStyle,
    this.prefixIconData,
    this.sufficIconData,
    this.onTapPrefixIcon,
    this.onTapSuffixIcon,
    this.noBorder = false,
    this.noEnabledBorder = false,
    this.noDisabledBorder = false,
    this.noFocusedBorder = false,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool obscureText;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onTapPrefixIcon;
  final void Function()? onTapSuffixIcon;
  final TextStyle? style;
  final IconData? prefixIconData;
  final IconData? sufficIconData;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? cursorHeight;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final bool readOnly;
  final bool? filled;
  final Color? fillColor;

  final bool noBorder;
  final InputBorder? border;
  final bool noEnabledBorder;
  final InputBorder? enabledBorder;
  final bool noDisabledBorder;
  final InputBorder? disabledBorder;
  final bool noFocusedBorder;
  final InputBorder? focusedBorder;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: AppDimensions.borderRadiusFull),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        maxLines: widget.maxLines,
        obscureText: isObscure,
        onTapOutside: widget.onTapOutside,
        cursorHeight: widget.cursorHeight,
        cursorColor: widget.cursorColor,
        cursorErrorColor: widget.cursorErrorColor,
        style:
            widget.style ??
            TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),

        readOnly: widget.readOnly,

        decoration: InputDecoration(
          filled: widget.filled,
          fillColor: widget.fillColor ?? Theme.of(context).colorScheme.surface,

          hintText: widget.hintText ?? '',
          hintStyle:
              widget.hintStyle ??
              TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),

          prefixIcon: widget.prefixIconData == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 4),
                  child: GestureDetector(
                    onTap: widget.onTapPrefixIcon,
                    child: Icon(
                      widget.prefixIconData,
                      size: 22,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),

          suffixIcon: widget.sufficIconData != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 4),
                  child: GestureDetector(
                    onTap: widget.onTapSuffixIcon,
                    child: Icon(
                      widget.sufficIconData,
                      size: 22,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : widget.obscureText
              ? Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 4),
                  child: GestureDetector(
                    onTap: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    child: Icon(
                      isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 22,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : null,

          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),

          border: widget.noBorder
              ? null
              : widget.border ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: AppDimensions.borderRadiusFull,
                    ),

          enabledBorder: widget.noEnabledBorder
              ? null
              : widget.border ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: AppDimensions.borderRadiusFull,
                    ),

          disabledBorder: widget.noDisabledBorder
              ? null
              : widget.border ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: AppDimensions.borderRadiusFull,
                    ),

          focusedBorder: widget.noFocusedBorder
              ? null
              : widget.border ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: AppDimensions.borderRadiusFull,
                    ),
        ),
      ),
    );
  }
}
