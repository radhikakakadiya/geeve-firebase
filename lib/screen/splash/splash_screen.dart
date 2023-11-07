import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeve_firebase/screen/login/login_screen.dart';
import 'package:geeve_firebase/screen/splash/widget/button.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/app_style.dart';
import '../../utils/app_text.dart';
import '../signin/signin_screen.dart';

int currentindex = 0;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.12,
            ),
            Image.asset(AppAesset().name),
            SizedBox(
              height: Get.height * 0.4,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentindex = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Container(
                        height: Get.height * 0.22,
                        width: Get.width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAesset().image),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(AppText().title,
                          style: textStyle.title.copyWith(fontSize: 18)),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(AppText().destription,
                            textAlign: TextAlign.center,
                            style: textStyle.description.copyWith(
                                color: Colors.grey.shade500, fontSize: 14)),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: Get.height * 0.001),
            Indicator(),
            SizedBox(
              height: Get.height * 0.039,
            ),
            SizedBox(
              child: Button(
                textclr: AppColor.white,
                tx: AppText().createa,
                color: AppColor.orange,
                onPressed: () {
                  Get.to(SigninScreen());
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Stack(
              children: [
                Container(
                  height: Get.height * 0.24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/image/botttomimg.png"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Button(
                    textclr: AppColor.orange,
                    tx: AppText().login,
                    color: AppColor.white,
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PageController pageController = PageController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => Container(
                margin: EdgeInsets.all(3),
                height: MediaQuery.of(context).size.height / 120,
                width: MediaQuery.of(context).size.width / 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentindex == index
                      ? Color(0xfffa7914)
                      : Colors.black45,
                ),
              )),
    );
  }
}
