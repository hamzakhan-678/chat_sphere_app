// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  final String? id;
  final String? senderId;
  final String? receiverId;
  final String? content;
  final String? type;
  final DateTime? timestamp;
  final bool? isRead;

  MessageModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.content,
    this.type,
    this.timestamp,
    this.isRead,
  });

  MessageModel copyWith({
    String? id,
    String? senderId,
    String? receiverId,
    String? content,
    String? type,
    DateTime? timestamp,
    bool? isRead,
  }) => MessageModel(
    id: id ?? this.id,
    senderId: senderId ?? this.senderId,
    receiverId: receiverId ?? this.receiverId,
    content: content ?? this.content,
    type: type ?? this.type,
    timestamp: timestamp ?? this.timestamp,
    isRead: isRead ?? this.isRead,
  );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    content: json["content"],
    type: json["type"],
    timestamp: json["timestamp"] == null
        ? null
        : DateTime.parse(json["timestamp"]),
    isRead: json["isRead"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "senderId": senderId,
    "receiverId": receiverId,
    "content": content,
    "type": type,
    "timestamp": timestamp?.toIso8601String(),
    "isRead": isRead,
  };
}
