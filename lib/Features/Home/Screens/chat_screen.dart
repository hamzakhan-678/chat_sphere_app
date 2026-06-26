import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/utils/screen_utils.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_field.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:chat_sphere_app/features/home/widgets/chat_screen_app_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();

  final List<String> messagesList = [
    'Hello!',
    'How are you?',
    'I wanted to talk to you about something very important',
    'Text me back whenever you are free',
    'I would love to talk about this with you',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ChatScreenAppBar(),

            Divider(color: Theme.of(context).colorScheme.surface),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: messagesList.length,
                      separatorBuilder: (context, index) {
                        return heightSpace(AppDimensions.spacingSmall);
                      },
                      itemBuilder: (context, index) {
                        final message = messagesList[index];
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: screenWidth(context) * 0.7,
                            ),
                            child: MyContainer(
                              padding: EdgeInsets.all(16),
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                                bottomRight: Radius.circular(35),
                              ),
                              child: MyBodyText(
                                text: message,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: AppDimensions.bottomNavHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.image_outlined,
                size: 28,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),

              widthSpaceResponsive(context, 0.03),

              Expanded(
                child: MyTextField(
                  controller: messageController,
                  hintText: 'Message...',
                  keyboardType: TextInputType.text,
                ),
              ),

              widthSpaceResponsive(context, 0.03),

              MyContainer(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Icon(
                    Icons.send_outlined,
                    size: 24,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
