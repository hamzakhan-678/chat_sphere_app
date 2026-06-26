import 'package:chat_sphere_app/Features/Profile/Controllers/theme_controller.dart';
import 'package:chat_sphere_app/core/router/app_routes.dart';
import 'package:chat_sphere_app/core/theme/app_dimensions.dart';
import 'package:chat_sphere_app/core/widgets/my_container.dart';
import 'package:chat_sphere_app/core/widgets/my_text_field.dart';
import 'package:chat_sphere_app/core/widgets/my_text_widgets.dart';
import 'package:chat_sphere_app/core/widgets/sized_box_spacers.dart';
import 'package:chat_sphere_app/features/home/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  final themeController = Get.find<ThemeController>();

  final List<Map<String, dynamic>> contactsList = [
    {
      'assetImageUrl': 'assets/avatar-1.png',
      'nameTitle': 'Hamza Khan',
      'message': 'Hello! How are you? Please call me back when you are free.',
      'isOnline': true,
      'unreadMessagesCount': 1,
    },
    {
      'assetImageUrl': 'assets/avatar-2.png',
      'nameTitle': 'Haroon Khan',
      'message': 'Hello! How are you? Please call me back when you are free.',
      'isOnline': true,
      'unreadMessagesCount': 3,
    },
    {
      'assetImageUrl': 'assets/avatar-3.png',
      'nameTitle': 'Naeem Khan',
      'message': 'Hello! How are you? Please call me back when you are free.',
      'isOnline': false,
      'unreadMessagesCount': 1,
    },
    {
      'assetImageUrl': 'assets/avatar-4.png',
      'nameTitle': 'Awais Khan',
      'message': 'Hello! How are you? Please call me back when you are free.',
      'isOnline': false,
      'unreadMessagesCount': 0,
    },
    {
      'assetImageUrl': 'assets/avatar-5.png',
      'nameTitle': 'Ali Khan',
      'message': 'Hello! How are you? Please call me back when you are free.',
      'isOnline': true,
      'unreadMessagesCount': 6,
    },
  ];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {});
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppDimensions.appBarHeight,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBodyText(text: 'Messages'),
            MyHeadingText(text: 'ChatSphere'),
          ],
        ),
        actions: [
          Obx(
            () => GestureDetector(
              onTap: () {
                themeController.toggleTheme();
                setState(() {});
              },
              child: MyContainer(
                padding: EdgeInsets.all(8),
                shape: BoxShape.circle,
                child: Icon(
                  themeController.isDarkMode.value
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          widthSpace(AppDimensions.spacingSmall),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.profile);
              },
              child: MyContainer(
                height: 45,
                width: 45,
                padding: EdgeInsets.zero,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                decorationImage: DecorationImage(
                  image: AssetImage('assets/avatar-me.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              controller: searchController,
              prefixIconData: Icons.search_outlined,
              hintText: 'Search Conversations',
              keyboardType: TextInputType.text,
            ),

            heightSpace(AppDimensions.spacingMedium),

            Expanded(
              child: ListView.separated(
                itemCount: contactsList.length,
                itemBuilder: (context, index) {
                  final contact = contactsList[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.chatScreen);
                    },
                    child: MessageTile(
                      assetImageUrl: contact['assetImageUrl'],
                      nameTitle: contact['nameTitle'],
                      message: contact['message'],
                      isOnline: contact['isOnline'],
                      unreadMessagesCount: contact['unreadMessagesCount'],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return heightSpace(AppDimensions.spacingSmallest);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
