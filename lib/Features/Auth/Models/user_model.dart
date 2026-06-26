// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImageUrl;
  final bool? isOnline;
  final DateTime? lastSeen;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImageUrl,
    this.isOnline,
    this.lastSeen,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    bool? isOnline,
    DateTime? lastSeen,
  }) => UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    isOnline: isOnline ?? this.isOnline,
    lastSeen: lastSeen ?? this.lastSeen,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profileImageUrl: json["profileImageUrl"],
    isOnline: json["isOnline"],
    lastSeen: json["lastSeen"] == null
        ? null
        : DateTime.parse(json["lastSeen"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "profileImageUrl": profileImageUrl,
    "isOnline": isOnline,
    "lastSeen": lastSeen?.toIso8601String(),
  };
}
