class UserModel {
  final String username;
  final String email;
  final String? uID;

  UserModel({
    required this.username,
    required this.email,
    this.uID,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': username,
      'email': email,
      'uID': uID,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['userName'] ?? '',
      email: map['email'] ?? '',
      uID: map['uID'],
    );
  }
}
