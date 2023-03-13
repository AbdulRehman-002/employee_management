// ignore_for_file: unnecessary_null_in_if_null_operators, must_be_immutable

import 'package:flutter/material.dart';
import 'package:virtoxed_text/utils/colors.dart';

class MyTextField extends StatefulWidget {
  String? hint;
  String label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final ValueChanged<String?>? onChanged;
  bool? obsecureText;
  bool? enabled;
  final String? initialValue;
  final bool filled;
  final Color? fillColor;
  Widget? suffix;
  Widget? prefixIcon;
  int maxLine;
  int minLines;
  Color? hintColor;
  Color? enabledBorderColor;
  MyTextField({
    Key? key,
    this.label = '',
    this.hint,
    this.controller,
    this.textInputType = TextInputType.text,
    required this.validator,
    this.onChanged,
    this.obsecureText = false,
    this.filled = true,
    this.enabled = true,
    this.fillColor = Colors.white,
    this.initialValue,
    this.suffix,
    this.prefixIcon,
    this.maxLine = 1,
    this.minLines = 1,
    this.enabledBorderColor,
    this.hintColor = kblackColor,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obsecureText!,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      enabled: widget.enabled!,
      maxLines: widget.maxLine,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue ?? widget.initialValue,
      cursorColor: kblackColor,
      decoration: InputDecoration(
          filled: widget.filled,
          fillColor: widget.fillColor ?? Colors.grey,
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.enabledBorderColor ?? kblackColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          label: widget.label.isEmpty
              ? null
              : Text(widget.label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: widget.hintColor,
                  )),
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: widget.hintColor,
          ),
          prefixIcon: widget.prefixIcon ?? null,
          suffixIcon: widget.suffix ?? null),
    );
  }
}
