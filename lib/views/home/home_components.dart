import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/views/employee_details/employee_details_screen.dart';

import '../../models/employee_model.dart';

class HomeScreenComponents {
  Widget employeesList({required List<EmployeeModel> employeeList}) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: employeeList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => employeeItem(
            name: employeeList[index].name!,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EmployeeDetailsScreen(emp: employeeList[index]),
                  ));
            }));
  }

  Widget employeeItem({required String name, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: kwhiteColor, border: Border.all(color: kblackColor)),
        child: Text(
          name,
          style: const TextStyle(fontSize: 18, color: kblackColor),
        ),
      ),
    );
  }
}
