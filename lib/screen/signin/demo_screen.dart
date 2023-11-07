import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmp = TextEditingController();

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());

      //add user
      addUserList(name.text.trim(), email.text.trim(), phone.text.trim(),
          password.text.trim(), confirmp.text.trim());
    }
  }

  Future addUserList(String name, String email, String phone, String password,
      String confirmp) async {
    await FirebaseFirestore.instance.collection("Users").add({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmp': confirmp,
    });
  }

  bool passwordConfirmed() {
    if (password.text.trim() == confirmp.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: 'name'),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(hintText: 'email'),
          ),
          TextFormField(
            controller: phone,
            decoration: InputDecoration(hintText: 'phone'),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(hintText: 'password'),
          ),
          TextFormField(
            controller: confirmp,
            decoration: InputDecoration(hintText: 'confirm password'),
          ),
          ElevatedButton(onPressed: signIn, child: Text('Submit'))
        ],
      ),
    );
  }
}
