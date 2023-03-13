import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtoxed_text/app_components/app_components.dart';
import 'package:virtoxed_text/models/employee_model.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/utils/const.dart';
import 'package:virtoxed_text/utils/sized_box.dart';
import 'package:virtoxed_text/views/employee_details/employee_detail_provider.dart';
import 'package:virtoxed_text/views/employee_details/employee_detail_screen_components.dart';
import 'package:virtoxed_text/views/update_employee/update_employee_screen.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  EmployeeModel emp;
  EmployeeDetailsScreen({Key? key, required this.emp}) : super(key: key);

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhiteColor,
        appBar: AppBar(
            backgroundColor: kwhiteColor,
            elevation: 2,
            automaticallyImplyLeading: false,
            title: const Text('Employee Details View',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kblackColor))),
        body: SafeArea(
          child: Container(
              height: heigth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.sh,
                          EmployeeDetailScreenComponents().detailItem(
                              title: 'Name', data: widget.emp.name!),
                          15.sh,
                          EmployeeDetailScreenComponents().detailItem(
                              title: 'Email', data: widget.emp.email!),
                          15.sh,
                          EmployeeDetailScreenComponents().detailItem(
                              title: 'Phone Number',
                              data: widget.emp.phone!.toString()),
                          15.sh,
                          EmployeeDetailScreenComponents().detailItem(
                              title: 'Salary',
                              data: widget.emp.salary.toString()),
                          15.sh,
                          EmployeeDetailScreenComponents().detailItem(
                              title: 'Designation',
                              data: widget.emp.desgination!),
                          15.sh,
                          EmployeeDetailScreenComponents().detailItem(
                              title: 'Joining Date',
                              data: widget.emp.joiningDate!),
                          10.sh,
                        ]),
                  )),
                  10.sh,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    AppComponents().simpleButton(
                        text: 'Update',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateEmployeeScreen(
                                        employeeModel: widget.emp,
                                      )));
                        },
                        width: 150),
                  ]),
                  10.sh,
                ],
              )),
        ));
  }
}
