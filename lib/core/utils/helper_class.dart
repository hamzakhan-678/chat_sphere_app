import 'dart:io';

import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class HelperClass {


  // Picking Image From Gallery or Camera
  static Future<File?> pickImage({required BuildContext context}) async {
    final picker = ImagePicker();

    File? fileImage;
    XFile? xFileImage;
    ImageSource? imageSource;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          contentPadding: AppDimensions.containerPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: MyHeadingText(text: 'Please select'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                imageSource = ImageSource.gallery;
                context.pop();
              },
              child: MyBodyText(text: 'Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () {
                imageSource = ImageSource.camera;
                context.pop();
              },
              child: MyBodyText(text: 'Camera'),
            ),
          ],
        );
      },
    );

    try {
      if (imageSource != null) {
        xFileImage = await picker.pickImage(source: ImageSource.gallery);
        if (xFileImage != null) {
          fileImage = File(xFileImage.path);
        }
      } else {
        debugPrint("No Options seleceted");
      }

      return fileImage;
    } on Exception catch (e) {
      debugPrint('Error during image Picker: ${e.toString()}');
      return fileImage;
    }
  }

  // static void myLoadingDialog({}) {
  //   showDialog(context: context, builder: builder)
  // }
}

