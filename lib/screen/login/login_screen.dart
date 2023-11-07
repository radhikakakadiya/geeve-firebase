import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/screen/verify/verify_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../auth/phone_auth.dart';
import '../signin/signin_controller.dart';
import '../signin/widget/custom_box.dart';
import '../signin/widget/textform.dart';
import '../splash/widget/button.dart';

class LoginScreen extends StatefulWidget {
  final buttonText;
  final index;
  const LoginScreen({super.key, this.buttonText, this.index});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // String? _validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return 'Please enter email';
  //   }
  //   RegExp emailRegExp = RegExp(
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  //   if (!emailRegExp.hasMatch(value)) {
  //     return 'Please valid email';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).unfocus();
            // FocusScopeNode currentFocus = FocusScope.of(context);
            // // if (!currentFocus.hasPrimaryFocus) {
            //   return currentFocus.unfocus();
            // // }
            // return FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(children: [
                  SizedBox(height: 80),
                  Image.asset(AppAesset().name),
                  SizedBox(height: 25),
                  SizedBox(
                    // height: Get.height * 0.105,
                    child: TextFormFields(
                        prefix: Icon(CupertinoIcons.mail_solid),
                        // vadidation: (value) {
                        //   bool emailvalid = RegExp(
                        //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`  {|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //       .hasMatch(value!);
                        //   if (value.isEmpty) {
                        //     return 'Enter Email';
                        //   } else if (!emailvalid) {
                        //     return "Enter Valid email";
                        //   }
                        //   return null;
                        // },
                        texts: AppText().emailadd,
                        con: emailController,
                        isprefix: true,
                        issufix: false),
                  ),
                  PasswordField(
                    vadidation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the Password';
                      } else {
                        return null;
                      }
                    },
                    texts: AppText().Pass,
                    con: passwordController,
                    isprefix: true,
                    prefix: Icon(Icons.lock),
                    issufix: true,
                  ),
                  SizedBox(
                    height: Get.height * 0.027,
                  ),
                  Row(
                    children: [
                      CustomBox(),
                      SizedBox(
                        width: 10,
                      ),
                      Text(AppText().remember,
                          style: textStyle().textform.copyWith(fontSize: 12)),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.045,
                  ),
                  GetBuilder<SigninController>(
                    builder: (controller) => Button(
                        textclr: AppColor.white,
                        tx: AppText().signin,
                        color: AppColor.orange,
                        onPressed: () async {
                          // controller.loading = true;
                          print("USER LIST--------->${controller.usersList}");
                          if (_formKey.currentState!.validate()) {
                            if (widget.index == null) {
                              for (int i = 0;
                                  i <= controller.data.length - 1;
                                  i++) {
                                if (controller.data[i]['Email'] ==
                                    controller.email.text) {
                                  controller.isExist = true;
                                  break;
                                } else {
                                  controller.isExist = false;
                                }
                              }
                              if (controller.isExist) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("User already exist"),
                                  ),
                                );
                                // controller.loading = false;
                                controller.update(['search']);
                              } else {
                                controller.usersList.add(
                                  {
                                    'First Name': controller.name.text,
                                    'Last Name': controller.lastname.text,
                                    'Number': controller.phone.text,
                                    'Email': controller.email.text,
                                    'Password': controller.password.text,
                                    'Confirm Password':
                                        controller.confirmpass.text,
                                  },
                                );
                                await controller.auth.verifyPhoneNumber(
                                  phoneNumber:
                                      '+${controller.countryCode} ${controller.phone.text}',
                                  verificationCompleted: (phoneAuthCredential) {
                                    if (kDebugMode) {
                                      print('DONE');
                                    }
                                    // controller.loading = false;

                                    controller.update(['search']);
                                  },
                                  verificationFailed: (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("ERROR"),
                                      ),
                                    );
                                    // controller.loading = false;
                                    controller.update(['search']);
                                  },
                                  codeSent: (verificationId,
                                      forceResendingToken) async {
                                    controller.verficationId = verificationId;
                                    // controller.loading = false;
                                    Get.to(VerifyScreen(
                                      token: verificationId,
                                    ));
                                    controller.update(['search']);
                                  },
                                  codeAutoRetrievalTimeout: (verificationId) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("REQUEST TIME OUT"),
                                      ),
                                    );
                                    // controller.loading = false;
                                    controller.update(['search']);
                                  },
                                );
                              }
                            } else {
                              // update process hear
                              // controller.loading = true;
                              print(
                                  "DOC ID ---------->${controller.userDocId}");
                              await controller.Users.doc(controller.userDocId)
                                  .update(
                                {
                                  'First Name': controller.name.text,
                                  'Last Name': controller.lastname.text,
                                  'Number': controller.phone.text,
                                  'Email': controller.email.text,
                                  'Password': controller.password.text,
                                  'Confirm Password':
                                      controller.confirmpass.text,
                                },
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Updated success"),
                                ),
                              );
                              // controller.loading = false;
                              controller.update(['search']);
                            }
                            controller.update(['search']);
                          } else {
                            // controller.loading = false;
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            // Get.to(PasswordScreen());
                          },
                          child: Text(
                            AppText().forgotq,
                            style: textStyle.description
                                .copyWith(color: AppColor.orange, fontSize: 11),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  Text(
                    AppText().alreadyAcc,
                    style: textStyle().textform.copyWith(fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        // Get.to(SignupScreen());
                      },
                      child: Text(
                        AppText().signup,
                        style: textStyle.description
                            .copyWith(color: AppColor.orange, fontSize: 11),
                      )),
                ]),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(AppAesset().bottomimg))),
              ],
            ),
          ),
        ));
  }
}
