import 'package:chat_sphere_app/core/theme/app_colors.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatScreenAppBar extends StatelessWidget {
  const ChatScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      height: AppDimensions.appBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widthSpaceResponsive(context, 0.02),

          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: MyContainer(
              padding: EdgeInsets.all(12),
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Colors.transparent),
              child: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          widthSpaceResponsive(context, 0.04),

          Stack(
            children: [
              MyContainer(
                height: 50,
                width: 50,
                border: Border.all(),
                shape: BoxShape.circle,
                decorationImage: DecorationImage(
                  image: AssetImage('assets/avatar-1.png'),
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

          widthSpaceResponsive(context, 0.02),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeadingText(
                text: 'Hamza Khan',
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                fontWeight: FontWeight.bold,
              ),
              height(AppDimensions.s),
              MyHintText(
                text: 'Online now',
                maxLines: 1,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          Spacer(),

          InkWell(
            onTap: () {},
            child: MyContainer(
              padding: EdgeInsets.all(12),
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Colors.transparent),
              child: Icon(
                Icons.phone_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          widthSpaceResponsive(context, 0.01),

          InkWell(
            onTap: () {},
            child: MyContainer(
              padding: EdgeInsets.all(12),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.transparent),
              child: Icon(
                Icons.videocam_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),

          widthSpaceResponsive(context, 0.02),
        ],
      ),
    );
  }
}
