import 'package:flutter/material.dart';
import 'package:virtoxed_text/utils/colors.dart';

class AppComponents {
  Widget simpleButton(
      {required String text,
      required Function()? onTap,
      double height = 60,
      double width = double.infinity,
      Color backgroundColor = Colors.white,
      Color borderColor = kblackColor,
      Color? shadowColor,
      Widget? child}) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(border: Border.all(color: borderColor, width: 2)),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //   const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(30))),
          // )
        ),
        child: child ??
            Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: kblackColor),
            ),
        onPressed: () => onTap!(),
      ),
    );
  }
}
