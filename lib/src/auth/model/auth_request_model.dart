import 'dart:convert';

class AuthRequestModel {
  final String email;
  final String password;

  AuthRequestModel({
    required this.email,
    required this.password,
  });

  AuthRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return AuthRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    return AuthRequestModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestModel.fromJson(String source) =>
      AuthRequestModel.fromMap(json.decode(source));
}

class SignupRequestModel extends AuthRequestModel {
  SignupRequestModel({
    required this.name,
    required super.email,
    required super.password,
  });

  final String name;

  @override
  SignupRequestModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return SignupRequestModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  @override
  factory SignupRequestModel.fromMap(Map<String, dynamic> map) {
    return SignupRequestModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory SignupRequestModel.fromJson(String source) =>
      SignupRequestModel.fromMap(json.decode(source));
}
