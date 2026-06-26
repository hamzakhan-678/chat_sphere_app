import 'package:chat_sphere_app/features/home/models/message_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final dbRef = FirebaseDatabase.instance;

  Future<void> sendMessage({required MessageModel message}) async {
    try {
      // await dbRef.child('');
    } catch (e) {
      debugPrint('Error sending message, Error: ${e.toString()}');
    }
  }
}
