import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/screen/verify/verify_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../signin/widget/textform.dart';
import '../splash/widget/button.dart';

class Phone_auth_screen extends StatefulWidget {
  const Phone_auth_screen({super.key});

  @override
  State<Phone_auth_screen> createState() => _Phone_auth_screenState();
}

class _Phone_auth_screenState extends State<Phone_auth_screen> {
  TextEditingController phoneController = Get.put(TextEditingController());
  var phone = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    phoneController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
            )),
        title: Text(AppText().forgotp, style: textStyle.heading),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text('Enter your Phone number',
              style:
                  textStyle().subtitle.copyWith(fontWeight: FontWeight.w500)),
          SizedBox(height: 30),
          TextFormFields(
              // vadidation: validateMobile,
              type: TextInputType.phone,
              texts: AppText().phone,
              con: phoneController,
              isprefix: false,
              issufix: false),
          SizedBox(height: 50),
          Button(
            textclr: AppColor.orange,
            tx: 'Continue',
            color: AppColor.white,
            onPressed: () async {
              await _auth.verifyPhoneNumber(
                phoneNumber: "${phoneController.text + phone}",
                verificationCompleted: (phoneAuthCredential) {},
                verificationFailed: (error) {},
                codeSent: (verificationId, forceResendingToken) {
                  Get.to(VerifyScreen(token: verificationId));
                },
                codeAutoRetrievalTimeout: (verificationId) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
