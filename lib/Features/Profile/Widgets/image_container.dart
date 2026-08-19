import 'dart:io';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.size = 50,
    this.assetUrl,
    this.networkUrl,
    this.fileImage,
    this.editIcon = false,
  });

  final double size;
  final String? assetUrl;
  final String? networkUrl;
  final File? fileImage;
  final bool editIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 2,
        ),
        image: (fileImage != null || assetUrl != null || networkUrl != null)
            ? DecorationImage(
                image: fileImage != null
                    ? FileImage(fileImage!)
                    : assetUrl != null
                    ? AssetImage(assetUrl!)
                    : NetworkImage(networkUrl!),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              )
            : null,
      ),
      child: editIcon
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyContainer(
                  padding: EdgeInsets.all(4),
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Icon(
                    Icons.edit,
                    size: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
