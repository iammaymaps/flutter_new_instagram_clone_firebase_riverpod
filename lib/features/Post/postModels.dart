class PostModels {
  final String titel;
  final String username;
  final String postId;
  final String uid;
  final String postImage;
  final List likes;
  final bool isSave;
  final String published;
  PostModels({
    required this.titel,
    required this.username,
    required this.postId,
    required this.uid,
    required this.postImage,
    required this.likes,
    required this.isSave,
    required this.published,
  });

  Map<String, dynamic> toMap() {
    return {
      'titel': titel,
      'username': username,
      'postId': postId,
      'uid': uid,
      'postImage': postImage,
      'likes': likes,
      'isSave': isSave,
      'published': published,
    };
  }

  factory PostModels.fromMap(Map<String, dynamic> map) {
    return PostModels(
      titel: map['titel'] ?? '',
      username: map['username'] ?? '',
      postId: map['postId'] ?? '',
      uid: map['uid'] ?? '',
      postImage: map['postImage'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      isSave: map['isSave'] ?? false,
      published: map['published'] ?? '',
    );
  }
}
