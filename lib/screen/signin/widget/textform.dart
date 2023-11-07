import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_style.dart';

class TextFormFields extends StatelessWidget {
  final String texts;
  final TextEditingController con;
  final Widget? prefix;
  final bool isprefix;
  final Widget? sufix;
  final bool issufix;
  final bool? isclick;
  final TextInputType? type;
  final Function(String)? onChange;
  final String? Function(String?)? vadidation;
  final bool? enable;
  final String? initialValue;

  TextFormFields({
    super.key,
    required this.texts,
    required this.con,
    this.prefix,
    required this.isprefix,
    this.sufix,
    required this.issufix,
    this.isclick,
    this.type,
    this.onChange,
    this.vadidation,
    this.enable,
    this.initialValue,
    // required this.icon
  });

  final ValueNotifier _visiblePassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: ValueListenableBuilder(
        valueListenable: _visiblePassword,
        builder: (context, value, child) => TextFormField(
          initialValue: initialValue,
          enabled: enable,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: vadidation,
          onChanged: onChange,
          keyboardType: type,
          obscureText: value,
          controller: con,
          style: TextStyle(
              fontSize: 15, fontFamily: 'FontsFree', color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            prefixIcon: isprefix
                ? IconButton(
                    iconSize: 18,
                    icon: prefix ?? SizedBox(),
                    onPressed: () {},
                  )
                : null,
            suffixIcon: issufix
                ? IconButton(
                    color: AppColor.black,
                    iconSize: 18,
                    onPressed: () =>
                        _visiblePassword.value = !_visiblePassword.value,
                    icon: value
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined))
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
            hintText: texts,
            hintStyle: textStyle().textform,
            filled: true,
            fillColor: Colors.grey.shade100,
            focusColor: Colors.black12,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff6f6f6)),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff6f6f6)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final String texts;
  final TextEditingController con;
  final Widget? prefix;
  final bool isprefix;
  final Widget? sufix;
  final bool issufix;
  final bool? isclick;
  final TextInputType? type;
  final Function(String)? onChange;
  final String? Function(String?)? vadidation;
  const PasswordField(
      {Key? key,
      required this.texts,
      required this.con,
      this.prefix,
      required this.isprefix,
      this.sufix,
      required this.issufix,
      this.isclick,
      this.type,
      this.onChange,
      this.vadidation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier _visiblePassword = ValueNotifier<bool>(true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: ValueListenableBuilder(
        valueListenable: _visiblePassword,
        builder: (context, value, child) => TextFormField(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: vadidation,
          onChanged: onChange,
          keyboardType: type,
          obscureText: value,
          controller: con,
          style: TextStyle(fontSize: 15, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: isprefix
                ? IconButton(
                    iconSize: 18,
                    icon: prefix ?? SizedBox(),
                    onPressed: () {},
                  )
                : null,
            suffixIcon: issufix
                ? IconButton(
                    color: AppColor.black,
                    iconSize: 18,
                    onPressed: () =>
                        _visiblePassword.value = !_visiblePassword.value,
                    icon: value
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined))
                : null,
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
            hintText: texts,
            hintStyle: textStyle().textform,
            filled: true,
            fillColor: Colors.grey.shade100,
            focusColor: Colors.black12,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff6f6f6)),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff6f6f6)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
