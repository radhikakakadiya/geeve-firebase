import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_asset.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';
import 'package:get/get.dart';

Appbar({required String title}) {
  return AppBar(
    leading: Builder(builder: (context) {
      return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SizedBox(
              height: 10, width: 10, child: Image.asset(AppAesset().drawer)));
    }),
    backgroundColor: AppColor.orange,
    toolbarHeight: 100,
    title: Text(
      title,
      style:
          textStyle().text.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
    ),
    // centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
  );
}
