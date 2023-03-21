import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      token: map['token'],
    );
  }

  factory UserModel.fromJson(String source) {
    return UserModel.fromMap(json.decode(source));
  }

  UserModel copyWith({
    required String? id,
    required String? name,
    required String? email,
    required String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  String toJson() => json.encode(toMap());
}
