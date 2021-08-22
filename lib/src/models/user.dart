import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String email;
  String name;
  String lastname;
  String phone;
  String password;
  String? image;
  String? isAvailable;
  String? sessionToken;

  User({
    this.id,
    required this.email,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.password,
    this.image,
    this.isAvailable,
    this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    sessionToken: json["session_token"],
    image: json["image"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "session_token": sessionToken,
    "image": image
  };
}
