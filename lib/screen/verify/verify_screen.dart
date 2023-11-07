import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/screen/donation/donation_screen.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../splash/widget/button.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatefulWidget {
  final String token;
  const VerifyScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController pinController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.token, smsCode: pinController.text);
    final userCredential = await auth.signInWithCredential(credential); //ama
    if (userCredential.user != null) {
      log("user mobile=${userCredential.user!.phoneNumber}");
    } else {
      log("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFffffff),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "Verifications",
            style: textStyle.heading,
          ),
        ),
      ),
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          children: [
            Column(
              children: [
                const Center(),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Type the verification code",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "we’ve sent you",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pinput(
                    onChanged: (value) {
                      pinController.text = value;
                      setState(() {});
                    },
                    length: 6,
                    controller: pinController,
                    showCursor: true,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Button(
                  textclr: AppColor.white,
                  tx: 'Continue',
                  color: AppColor.orange,
                  onPressed: () {
                    setState(() {
                      verifyOtp();
                    });
                    Get.to(DonationScreen());
                  },
                ),
                SizedBox(height: Get.height * 0.28),
              ],
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(AppAesset().bottomimg))),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: Get.width * 0.13,
    height: Get.height * 0.06,
    margin: EdgeInsets.all(6),
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColor.orange,
        width: 1,
      ),
      // color: Colors.black12,
      borderRadius: BorderRadius.circular(7),
    ),
  );
}
