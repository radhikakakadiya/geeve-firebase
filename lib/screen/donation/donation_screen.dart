import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/screen/donation/widget/appbar.dart';
import 'package:geeve_firebase/screen/donation/widget/drawer.dart';
import 'package:geeve_firebase/screen/signin/signin_controller.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import 'package:get/get.dart';

class DonationScreen extends StatefulWidget {
  DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String searchQuery = '';

  SigninController _controller = Get.put(SigninController());

  Future<void> getDataFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('login') // Replace with your collection name
        .get();

    setState(() {
      _controller.data = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  final CollectionReference _login =
      FirebaseFirestore.instance.collection("login");

  List<Map<String, dynamic>> getFilteredData() {
    return _controller.data.where((data) {
      final name = data['name'].toString().toLowerCase();
      return name.contains(searchQuery.toLowerCase());
    }).toList();
  }

  Future<void> _delete(String product) async {
    await _login.doc(product).delete();
  }

  @override
  Widget build(BuildContext context) {
    final filterData = getFilteredData();

    return Scaffold(
      drawer: drawer(),
      appBar: Appbar(title: AppText().donation),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: GetBuilder<SigninController>(builder: (controller) {
              return StreamBuilder(
                  stream: controller.Users.orderBy('login').snapshots(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final item = filterData[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Row(
                            children: [
                              Material(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height:
                                      MediaQuery.of(context).size.height / 11,
                                  width:
                                      MediaQuery.of(context).size.width / 1.45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: AppColor.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.09),
                                            blurRadius: 4,
                                            offset: const Offset(1, 6),
                                            blurStyle: BlurStyle.normal),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, left: 10),
                                        child: Text("${item['name']}",
                                            //   "${myModel[index].name}",
                                            style: textStyle.title.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text("lastname",
                                            // "${list[index].email}",
                                            style: textStyle.title.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text("emailAddress",
                                            // "${list[index].phone}",
                                            style: textStyle.title.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 12, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.name.text = item['First Name'];
                                    controller.lastname.text =
                                        item['Last Name'];
                                    controller.phone.text = item['Number'];
                                    controller.email.text = item['Email'];
                                    controller.password.text = item['Password'];
                                    controller.confirmpass.text =
                                        item['Confirm Password'];
                                    controller.userDocId =
                                        snapshot.data!.docs[index].id;
                                    // Navigator.push(
                                    //   context,
                                    //   // MaterialPageRoute(
                                    //   //   builder: (context) => const SignUpScreen(
                                    //   //     ButtonText: "Update",
                                    //   //     index: 2,
                                    //   //   ),
                                    //   // ),
                                    // );
                                  },
                                  child: Image.asset(
                                    AppAesset().edit,
                                    height: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          contentPadding: EdgeInsets.all(20),
                                          alignment: Alignment.center,
                                          title: const Text(
                                              'Sure you want to delete??'),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('No')),
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: const Text('Yes'))
                                          ],
                                        ),
                                      );
                                    },
                                    child: Image.asset(AppAesset().delete,
                                        height: 17),
                                  )),
                            ],
                          ),
                        );
                      },
                    );
                  });
            }),
          )),
        ],
      ),
    );
  }
}
