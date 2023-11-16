import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String uid;
  final String fullname;
  final String photoUrl;
  final String username;
  final List followers;
  final List following;
  UserModel({
    required this.email,
    required this.uid,
    required this.fullname,
    required this.photoUrl,
    required this.username,
    required this.followers,
    required this.following,
  });

  UserModel copyWith({
    String? email,
    String? uid,
    String? fullname,
    String? photoUrl,
    String? username,
    List? followers,
    List? following,
  }) {
    return UserModel(
      email: email ?? this.email,
      uid: uid ?? this.uid,
      fullname: fullname ?? this.fullname,
      photoUrl: photoUrl ?? this.photoUrl,
      username: username ?? this.username,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
      'fullname': fullname,
      'photoUrl': photoUrl,
      'username': username,
      'followers': followers,
      'following': following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      fullname: map['fullname'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      username: map['username'] ?? '',
      followers: List.from(map['followers']),
      following: List.from(map['following']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, uid: $uid, fullname: $fullname, photoUrl: $photoUrl, username: $username, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.uid == uid &&
        other.fullname == fullname &&
        other.photoUrl == photoUrl &&
        other.username == username &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following);
  }

  @override
  int get hashCode {
    return email.hashCode ^
        uid.hashCode ^
        fullname.hashCode ^
        photoUrl.hashCode ^
        username.hashCode ^
        followers.hashCode ^
        following.hashCode;
  }
}
