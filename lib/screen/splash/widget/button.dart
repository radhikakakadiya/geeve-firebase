// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';

class Button extends StatelessWidget {
  final int? index;
  final Function()? onPressed;
  final String tx;
  final Color color;
  final Color textclr;
  const Button(
      {super.key,
      required this.tx,
      this.onPressed,
      required this.color,
      required this.textclr,
      this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), backgroundColor: color),
          onPressed: onPressed,
          child: Text(tx,
              style: TextStyle(
                  decorationColor: AppColor.white,
                  fontSize: 16,
                  fontFamily: 'FontsFree',
                  color: textclr))),
    );
  }
}

class checkButton extends StatelessWidget {
  const checkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class frame extends StatelessWidget {
  const frame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(top: 900, child: Image.asset("asset/image/frame.png"));
  }
}
