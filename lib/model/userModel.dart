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
    required this.fullname,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.followers,
    required this.following,
  });

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
      fullname: map['fullname'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      username: map['username'] ?? '',
      uid: map['uid'] ?? '',
      followers: List.from(map['followers']),
      following: List.from(map['following']),
    );
  }
}
