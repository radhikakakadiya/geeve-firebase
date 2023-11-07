import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geeve_firebase/model/user_model.dart';
import 'package:geeve_firebase/repository/user_repository.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  static SigninController get instance => Get.find();
  final _userRepo = Get.put(Userrepository());

  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference Users = FirebaseFirestore.instance.collection('user');

  // otp screen variable
  String countryCode = "91";

  var verficationId;

  String userDocId = "";

  // to check user is exist or not
  bool isExist = false;
  //
  bool loading = false;

  // to check user is registered or not
  bool isRegistred = false;

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  List<Map<String, dynamic>> usersList = [];
  List<Map<String, dynamic>> data = [];

  // check box
  bool checkBox = false;

  // late int value;
}
