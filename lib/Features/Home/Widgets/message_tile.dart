import 'package:chat_sphere_app/core/theme/app_colors.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.assetImageUrl,
    required this.nameTitle,
    required this.message,
    required this.isOnline,
    required this.unreadMessagesCount,
  });

  final String assetImageUrl;
  final String nameTitle;
  final String message;
  final bool isOnline;
  final int unreadMessagesCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.innerWidgetPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              MyContainer(
                height: 55,
                width: 55,
                border: Border.all(),
                shape: BoxShape.circle,
                decorationImage: DecorationImage(
                  image: AssetImage(assetImageUrl),
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: MyContainer(
                  height: 14,
                  width: 14,
                  border: Border.all(),
                  shape: BoxShape.circle,
                  color: AppColors.success,
                ),
              ),
            ],
          ),

          widthSpace(AppDimensions.spacingSmall),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyHeadingText(
                          text: nameTitle,
                          color: Theme.of(context).colorScheme.onSurface,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MyHintText(
                        text: 'Yesterday',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: MyHintText(
                          fontSize: 13,
                          text: message,
                          maxLines: 1,
                          color: Theme.of(context).colorScheme.onSurface,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      (unreadMessagesCount == 0)
                          ? SizedBox.shrink()
                          : MyContainer(
                              padding: EdgeInsets.all(6),
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                              child: Center(
                                child: MyHintText(
                                  text: unreadMessagesCount.toString(),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
