import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/model/user_model.dart';
import 'package:geeve_firebase/screen/signin/signin_controller.dart';
import 'package:geeve_firebase/screen/signin/widget/textform.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../auth/phone_auth.dart';
import '../splash/widget/button.dart';
import '../verify/verify_screen.dart';

class SigninScreen extends StatefulWidget {
  final buttonText;
  final index;
  const SigninScreen({super.key, this.buttonText, this.index});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  var phone = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // @override
  // void initState() {
  //   controller.phone.text = "+91";
  //   super.initState();
  // }
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  bool value = false;
  GlobalKey _formKey = GlobalKey();

  SigninController _controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: Get.height * 0.099),
            Image.asset(AppAesset().name),
            SizedBox(height: Get.height * 0.023),
            TextFormFields(
                vadidation: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
                texts: AppText().firstnm,
                con: controller.name,
                isprefix: false,
                issufix: false),
            TextFormFields(
                vadidation: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the lastname';
                  }
                  return null;
                },
                texts: AppText().lastnm,
                con: lastnameController,
                isprefix: false,
                issufix: false),
            TextFormFields(
                // enable: _index == null ? true : false,
                texts: AppText().email,
                con: emailController,
                isprefix: false,
                issufix: false),
            TextFormFields(
                // vadidation: validateMobile,
                type: TextInputType.phone,
                texts: AppText().phone,
                con: phoneController,
                isprefix: false,
                issufix: false),
            PasswordField(
              vadidation: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the Password';
                  // } else if (passwordController.length < 8) {
                  //   return 'At least 8 character required';
                }
                return null;
              },
              texts: AppText().Pass,
              con: passwordController,
              isprefix: false,
              issufix: true,
            ),
            PasswordField(
              vadidation: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the confirm password';
                } else if (passwordController.text !=
                    confirmpassController.text) {
                  return 'Not match with password';
                }
                return null;
              },
              texts: AppText().enterconfirmp,
              con: confirmpassController,
              isprefix: false,
              issufix: true,
            ),
            SizedBox(height: Get.height * 0.021),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this.value = !this.value;
                      print(value);
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: value
                          ? Container(
                              height: 31,
                              width: 31,
                              child: Icon(Icons.check, color: AppColor.orange),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                            )
                          : Container(
                              height: 31,
                              width: 31,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                            )),
                ),
                SizedBox(width: Get.width * 0.02),
                Text(AppText().iagree,
                    style: textStyle().textform.copyWith(fontSize: 12)),
                SizedBox(width: Get.width * 0.005),
                Text(AppText().terms,
                    style: textStyle.description
                        .copyWith(color: AppColor.orange, fontSize: 11)),
              ],
            ),
            SizedBox(height: Get.height * 0.07),
            Stack(
              children: [
                Container(
                    height: Get.height * 0.29,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(AppAesset().bottomimg))),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: Get.height * 0.07,
                        width: Get.width * 0.84,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.07),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                  blurStyle: BlurStyle.normal),
                            ]),
                        child: GetBuilder<SigninController>(
                          id: 'search',
                          builder: (controller) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: AppColor.orange,
                              ),
                              onPressed: () async {
                                final userData = UserModel(
                                    name: controller.name.text.trim(),
                                    lastname: controller.lastname.text.trim(),
                                    email: controller.email.text.trim(),
                                    phone: controller.phone.text.trim(),
                                    password: controller.password.text.trim(),
                                    confirmp:
                                        controller.confirmpass.text.trim());
                                if (/*_formKey.currentState!.validation*/ true) {
                                  if (widget.index == null) {
                                    for (int i = 0;
                                        i <= controller.data.length - 1;
                                        i++) {
                                      if (controller.data[i]['Email'] ==
                                          controller.email.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Email Already exits')));
                                      }
                                    }
                                  }
                                }
                                await _auth.verifyPhoneNumber(
                                  phoneNumber:
                                      "${phoneController.text + phone}",
                                  verificationCompleted:
                                      (phoneAuthCredential) {},
                                  verificationFailed: (error) {},
                                  codeSent:
                                      (verificationId, forceResendingToken) {
                                    Get.to(VerifyScreen(token: verificationId));
                                    controller.update(['search']);
                                  },
                                  codeAutoRetrievalTimeout: (verificationId) {},
                                );
                              },
                              // onPressed: () async {
                              //   controller.loading = true;
                              //   print(
                              //       "USER LIST--------->${controller.usersList}");
                              //   if (/*_formKey.currentState!.validate()*/ true) {
                              //     if (widget.index == null) {
                              //       for (int i = 0;
                              //           i <= controller.data.length - 1;
                              //           i++) {
                              //         if (controller.data[i]['Email'] ==
                              //             controller.email.text) {
                              //           controller.isExist = true;
                              //           break;
                              //         } else {
                              //           controller.isExist = false;
                              //         }
                              //       }
                              //       if (controller.isExist) {
                              //         ScaffoldMessenger.of(context)
                              //             .showSnackBar(
                              //           const SnackBar(
                              //             content: Text("User already exist"),
                              //           ),
                              //         );
                              //         controller.loading = false;
                              //         controller.update(['search']);
                              //       } else {
                              //         controller.usersList.add(
                              //           {
                              //             'First Name': controller.name.text,
                              //             'Last Name': controller.lastname.text,
                              //             'Number': controller.phone.text,
                              //             'Email': controller.email.text,
                              //             'Password': controller.password.text,
                              //             'Confirm Password':
                              //                 controller.confirmpass.text,
                              //           },
                              //         );
                              //         await controller.auth.verifyPhoneNumber(
                              //           phoneNumber:
                              //               '+${controller.countryCode} ${controller.phone.text}',
                              //           verificationCompleted:
                              //               (phoneAuthCredential) {
                              //             if (kDebugMode) {
                              //               print('DONE');
                              //             }
                              //             controller.loading = false;
                              //
                              //             controller.update(['search']);
                              //           },
                              //           verificationFailed: (error) {
                              //             ScaffoldMessenger.of(context)
                              //                 .showSnackBar(
                              //               const SnackBar(
                              //                 content: Text("ERROR"),
                              //               ),
                              //             );
                              //             controller.loading = false;
                              //             controller.update(['search']);
                              //           },
                              //           codeSent: (verificationId,
                              //               forceResendingToken) async {
                              //             controller.verficationId =
                              //                 verificationId;
                              //             controller.loading = false;
                              //             Navigator.push(
                              //               context,
                              //               MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     VerifyScreen(
                              //                   token: verificationId,
                              //                 ),
                              //               ),
                              //             );
                              //             controller.update(['search']);
                              //           },
                              //           codeAutoRetrievalTimeout:
                              //               (verificationId) {
                              //             ScaffoldMessenger.of(context)
                              //                 .showSnackBar(
                              //               const SnackBar(
                              //                 content: Text("REQUEST TIME OUT"),
                              //               ),
                              //             );
                              //             controller.loading = false;
                              //             controller.update(['search']);
                              //           },
                              //         );
                              //       }
                              //     } else {
                              //       // update process hear
                              //       controller.loading = true;
                              //       print(
                              //           "DOC ID ---------->${controller.userDocId}");
                              //       await controller.Users.doc(
                              //               controller.userDocId)
                              //           .update(
                              //         {
                              //           'First Name': controller.name.text,
                              //           'Last Name': controller.lastname.text,
                              //           'Number': controller.phone.text,
                              //           'Email': controller.email.text,
                              //           'Password': controller.password.text,
                              //           'Confirm Password':
                              //               controller.confirmpass.text,
                              //         },
                              //       );
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //           content: Text("Updated success"),
                              //         ),
                              //       );
                              //       controller.loading = false;
                              //       controller.update(['search']);
                              //     }
                              //     controller.update(['search']);
                              //   } else {
                              //     controller.loading = false;
                              //   }
                              // },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'FontsFree',
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Text(
                      AppText().alreadyAcc,
                      style: textStyle().textform.copyWith(fontSize: 12),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SigninScreen());
                        },
                        child: Text(AppText().signin,
                            style: textStyle().textform.copyWith(
                                fontSize: 13, color: AppColor.orange)))
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
