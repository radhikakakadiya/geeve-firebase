import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/screen/login/login_screen.dart';

import '../../../utils/app_asset.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';
import '../../../utils/app_text.dart';
import '../../donation/donation_screen.dart';
import '../../signin/signin_screen.dart';
import '../../splash/splash_screen.dart';
import '../../splash/widget/button.dart';
import 'package:get/get.dart';

import 'drawer_controller.dart';

class drawer extends StatelessWidget {
  drawer({Key? key}) : super(key: key);
  drawerControllerc obj = Get.put(drawerControllerc());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.white,
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.0099),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: Get.height * 0.30,
                  width: double.infinity,
                  color: AppColor.white),
              Column(
                children: [
                  Material(
                    elevation: 8,
                    shape: const CircleBorder(side: BorderSide.none),
                    child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.white,
                        child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(AppAesset().home))),
                  ),
                  SizedBox(height: Get.height * 0.013),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColor.orange,
                            child: Icon(
                              Icons.edit,
                              size: 15,
                              color: AppColor.white,
                            ),
                          )),
                      Text(AppText().username,
                          style: textStyle.title.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 18))
                    ],
                  ),
                  Text(AppText().useremail,
                      style: textStyle.description.copyWith(fontSize: 12)),
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 1,
                color: AppColor.black,
              ),
              GetBuilder<drawerControllerc>(
                id: 'draw',
                builder: (controller) {
                  return Container(
                    color: AppColor.white,
                    height: Get.height * 0.40,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: _drawer.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            currentindex = index;
                            if (currentindex == 0) {
                              // Get.to(DashBoardScreen());
                            } else if (currentindex == 1) {
                              Get.to(DonationScreen());
                            }
                            obj.update(['draw']);
                          },
                          child: ListTile(
                              visualDensity:
                                  VisualDensity(horizontal: -1, vertical: -1),
                              title: Text(_drawer[index].text,
                                  style:
                                      TextStyle(color: Colors.grey.shade700)),
                              leading: Image.asset(_drawer[index].image,
                                  height: 25)),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 1,
                          color: AppColor.black,
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
                height: 1,
                color: AppColor.black,
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: Get.height * 0.28,
                color: AppColor.white,
              ),
              Positioned(
                top: 50,
                left: 40,
                child: Container(
                  width: 210,
                  child: Button(
                    textclr: AppColor.white,
                    color: AppColor.orange,
                    tx: 'Logout',
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class drawers {
  final String image;
  final String text;
  drawers(this.image, this.text);
}

List<drawers> _drawer = [
  drawers(AppAesset().dashboard, AppText().dash),
  drawers(AppAesset().donated, AppText().donation),
  drawers(AppAesset().text, AppText().text),
  drawers(AppAesset().trasaction, AppText().transaction),
  drawers(AppAesset().ana, AppText().ana),
  drawers(AppAesset().setting, AppText().setting),
];
