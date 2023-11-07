// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class CustomBox extends StatefulWidget {
  const CustomBox({super.key});

  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                )
              : Container(
                  height: 31,
                  width: 31,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                )),
    );
  }
}
