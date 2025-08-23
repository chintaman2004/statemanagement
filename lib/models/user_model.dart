// lib/models/user_model.dart
class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? phone;
  final String? profileImageUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.phone,
    this.profileImageUrl,
  });

  // Convert UserModel -> Map (for Firestore or local storage)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
    };
  }

  // Convert Map -> UserModel (from Firestore or local storage)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
      profileImageUrl: map['profileImageUrl'],
    );
  }
}
