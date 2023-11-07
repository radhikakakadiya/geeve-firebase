import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  final String confirmp;

  UserModel({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmp,
  });

  toJson() {
    return {
      "Name": name,
      "Lastname": lastname,
      "Email": email,
      "Phone": phone,
      "Password": password,
      "Confirmp": confirmp
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        name: data["Name"],
        lastname: data["Lastname"],
        email: data["Email"],
        phone: data["Phone"],
        password: data["Password"],
        confirmp: data["Confirmp"]);
  }
}
