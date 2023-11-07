import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class Userrepository extends GetxController {
  static Userrepository get instance => Get.find();

  final db = FirebaseFirestore.instance;

  ///store user firestore
  Future<void> createUser(UserModel user) async {
    await db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar(
        'Success',
        'your account has been created',
      );
    }).catchError((error, stackTrace) {
      Get.snackbar('Error', 'Something went wrong');
      print("Error===>$error");
    });
  }

  ///fetch all users data
  Future<UserModel> getUserDetail(String email) async {
    final snapshot =
        await db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await db.collection("Users").doc(user.id).update(user.toJson());
  }
}
