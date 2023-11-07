// // ignore_for_file: valid_regexps, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names, equal_keys_in_map, use_build_context_synchronously
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SignUpCenter extends StatefulWidget {
//   const SignUpCenter({
//     super.key,
//     this.buttonText,
//     this.index,
//   });
//
//   final buttonText;
//   final index;
//
//   @override
//   State<SignUpCenter> createState() => _SignUpCenterState();
// }
//
// class _SignUpCenterState extends State<SignUpCenter> {
//   CounterController counterController = Get.put(CounterController());
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     print("INDEX 3------------>${widget.index}");
//     final deviceHeight = MediaQuery.of(context).size.height;
//     final deviceWidth = MediaQuery.of(context).size.width;
//
//     return GetBuilder<CounterController>(
//       builder: (controller) {
//         return Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: deviceHeight * 0.05),
//               Container(
//                 height: deviceHeight * 0.07,
//                 width: deviceWidth * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colores.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: deviceWidth * 0.04,
//                     vertical: deviceHeight * 0.01,
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: controller.firstName,
//                     validator: (value) {
//                       if (value!.trim().isEmpty) {
//                         return 'Please enter first name';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "First Name",
//                       hintStyle: Medium,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.03),
//               Container(
//                 height: deviceHeight * 0.07,
//                 width: deviceWidth * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colores.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: deviceWidth * 0.04,
//                     vertical: deviceHeight * 0.01,
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: controller.lastName,
//                     validator: (value) {
//                       if (value!.trim().isEmpty) {
//                         return 'Please enter last name';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "Last Name",
//                       hintStyle: Medium,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.03),
//               Container(
//                 height: deviceHeight * 0.07,
//                 width: deviceWidth * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colores.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: deviceWidth * 0.04,
//                     vertical: deviceHeight * 0.01,
//                   ),
//                   child: TextField(
//                     controller: controller.number,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "Phone",
//                       hintStyle: Medium,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.03),
//               Container(
//                 height: deviceHeight * 0.07,
//                 width: deviceWidth * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colores.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: deviceWidth * 0.04,
//                     vertical: deviceHeight * 0.01,
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: controller.emailcntrl,
//                     validator: (value) {
//                       RegExp emailExp = RegExp(
//                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//                       if (value!.trim().isEmpty) {
//                         return 'please enter email';
//                       } else if (!emailExp.hasMatch(value)) {
//                         return 'please enter valid email';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "Email",
//                       hintStyle: Medium,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.03),
//               Container(
//                 height: deviceHeight * 0.07,
//                 width: deviceWidth * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colores.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: deviceWidth * 0.04,
//                     vertical: deviceHeight * 0.01,
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: controller.passWord,
//                     // validator: (value) {
//                     //   RegExp passwordExp = RegExp(
//                     //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
//                     //   if (value!.trim().isEmpty) {
//                     //     return 'Please enter password';
//                     //   } else if (!passwordExp.hasMatch(value)) {
//                     //     return 'please enter valid password';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       hintStyle: Medium,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.03),
//               Container(
//                 height: deviceHeight * 0.07,
//                 width: deviceWidth * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colores.grey,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: deviceWidth * 0.04,
//                     vertical: deviceHeight * 0.01,
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: controller.confirmPassword,
//                     // validator: (value) {
//                     //   RegExp confirmpasswordExp = RegExp(
//                     //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
//                     //   if (controller.passWord.text !=
//                     //       controller.confirmPassword.text) {
//                     //     return 'password and confirm password does not match';
//                     //   } else if (value!.trim().isEmpty) {
//                     //     return 'please enter confirmpassword';
//                     //   } else if (!confirmpasswordExp.hasMatch(value)) {
//                     //     return 'please enter valid confirmpassword';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                       hintText: "Confirm password",
//                       hintStyle: Medium,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.025),
//               Padding(
//                 padding: EdgeInsets.only(left: deviceWidth * 0.03),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     GetBuilder<CounterController>(
//                       builder: (controller) {
//                         return Checkbox(
//                           value: controller.checkBox,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           onChanged: (value) {
//                             controller.checkBox = value!;
//                           },
//                         );
//                       },
//                     ),
//                     Text(
//                       "I agree to the geeve ",
//                       style: Medium,
//                     ),
//                     Text(
//                       "Terms and Conditions",
//                       style: OrangeText,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: deviceHeight * 0.025),
//               GetBuilder<CounterController>(
//                 id: 'search',
//                 builder: (controller) {
//                   return controller.loading
//                       ? const Center(child: CircularProgressIndicator())
//                       : GestureDetector(
//                           onTap: () async {
//                             controller.loading = true;
//                             print("USER LIST--------->${controller.usersList}");
//                             if (formKey.currentState!.validate()) {
//                               if (widget.index == null) {
//                                 for (int i = 0;
//                                     i <= controller.data.length - 1;
//                                     i++) {
//                                   if (controller.data[i]['Email'] ==
//                                       controller.emailcntrl.text) {
//                                     controller.isExist = true;
//                                     break;
//                                   } else {
//                                     controller.isExist = false;
//                                   }
//                                 }
//                                 if (controller.isExist) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text("User already exist"),
//                                     ),
//                                   );
//                                   controller.loading = false;
//                                   controller.update(['search']);
//                                 } else {
//                                   controller.usersList.add(
//                                     {
//                                       'First Name': controller.firstName.text,
//                                       'Last Name': controller.lastName.text,
//                                       'Number': controller.number.text,
//                                       'Email': controller.emailcntrl.text,
//                                       'Password': controller.passWord.text,
//                                       'Confirm Password':
//                                           controller.confirmPassword.text,
//                                     },
//                                   );
//                                   await controller.auth.verifyPhoneNumber(
//                                     phoneNumber:
//                                         '+${controller.countryCode} ${controller.number.text}',
//                                     verificationCompleted:
//                                         (phoneAuthCredential) {
//                                       if (kDebugMode) {
//                                         print('DONE');
//                                       }
//                                       controller.loading = false;
//
//                                       controller.update(['search']);
//                                     },
//                                     verificationFailed: (error) {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text("ERROR"),
//                                         ),
//                                       );
//                                       controller.loading = false;
//                                       controller.update(['search']);
//                                     },
//                                     codeSent: (verificationId,
//                                         forceResendingToken) async {
//                                       controller.verficationId = verificationId;
//                                       controller.loading = false;
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               const OtpScreen(),
//                                         ),
//                                       );
//                                       controller.update(['search']);
//                                     },
//                                     codeAutoRetrievalTimeout: (verificationId) {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text("REQUEST TIME OUT"),
//                                         ),
//                                       );
//                                       controller.loading = false;
//                                       controller.update(['search']);
//                                     },
//                                   );
//                                 }
//                               } else {
//                                 // update process hear
//                                 controller.loading = true;
//                                 print(
//                                     "DOC ID ---------->${controller.userDocId}");
//                                 await controller.Users.doc(controller.userDocId)
//                                     .update(
//                                   {
//                                     'First Name': controller.firstName.text,
//                                     'Last Name': controller.lastName.text,
//                                     'Number': controller.number.text,
//                                     'Email': controller.emailcntrl.text,
//                                     'Password': controller.passWord.text,
//                                     'Confirm Password':
//                                         controller.confirmPassword.text,
//                                   },
//                                 );
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Updated success"),
//                                   ),
//                                 );
//                                 controller.loading = false;
//                                 controller.update(['search']);
//                               }
//                               controller.update(['search']);
//                             } else {
//                               controller.loading = false;
//                             }
//                           },
//                           child: Container(
//                             height: deviceHeight * 0.06,
//                             width: deviceWidth * 0.9,
//                             decoration: BoxDecoration(
//                               color: Colores.orange,
//                               borderRadius: BorderRadius.circular(30),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colores.shadow,
//                                   offset: Offset(1, 3),
//                                   blurRadius: 5,
//                                   spreadRadius: 1,
//                                 )
//                               ],
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "${widget.buttonText}",
//                                 style: ButtonText,
//                               ),
//                             ),
//                           ),
//                         );
//                 },
//               ),
//               SizedBox(height: deviceHeight * 0.04),
//               Text(
//                 "Already have an account?",
//                 style: Medium,
//               ),
//               SizedBox(height: deviceHeight * 0.01),
//               GestureDetector(
//                 onTap: () async {
//                   controller.loginEmail.clear();
//                   controller.loginPassword.clear();
//
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const LoginScreen(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   "Sign in",
//                   style: OrangeText,
//                 ),
//               ),
//               Image.asset("assets/images/bottom_image.png"),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// // ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables
//
// class CounterController extends GetxController {
//   // firebase number sign up instance
//   FirebaseAuth auth = FirebaseAuth.instance;
//   CollectionReference Users = FirebaseFirestore.instance.collection('user');
//
//   // otp screen variable
//   String countryCode = "91";
//
//   var verficationId;
//
//   // List<Map<String, dynamic>> Users = [];
//   List<Map<String, dynamic>> usersList = [];
//   List<Map<String, dynamic>> data = [];
//
//   // to get user documnet id
//   String userDocId = "";
//   // to create circular progress indicator
//   bool loading = false;
//   // check box
//   bool checkBox = false;
//
//   // to check user is exist or not
//   bool isExist = false;
//
//   // to check user is registered or not
//   bool isRegistred = false;
//
//   // to check email and password in login screen
//   bool credential = false;
//   late int value;
//   late int searchIndex;
//
//   // non profit drawer items
//
//   List Name = [
//     "Dash board",
//     "Donation page",
//     "Text 2 Give",
//     "Transaction",
//     "Analytics",
//     "Settings"
//   ];
//
//   // sign up screen controller
//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController number = TextEditingController();
//   TextEditingController emailcntrl = TextEditingController();
//   TextEditingController passWord = TextEditingController();
//   TextEditingController confirmPassword = TextEditingController();
//
//   //login controller
//   TextEditingController loginEmail = TextEditingController();
//   TextEditingController loginPassword = TextEditingController();
// }
