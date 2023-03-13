import 'package:flutter/material.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/utils/sized_box.dart';

class EmployeeDetailScreenComponents {
  Widget detailItem({required String title, required String data}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 20, color: kblackColor, fontWeight: FontWeight.bold)),
        10.sh,
        Text(data,
            style: TextStyle(
                fontSize: 16,
                color: kblackColor.withOpacity(0.7),
                fontWeight: FontWeight.normal)),
      ],
    );
  }
}
