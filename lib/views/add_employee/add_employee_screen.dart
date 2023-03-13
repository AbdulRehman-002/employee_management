import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/utils/const.dart';
import 'package:virtoxed_text/utils/sized_box.dart';
import 'package:virtoxed_text/views/add_employee/add_employee_provider.dart';

import '../../app_components/app_components.dart';
import '../../app_components/textformfield.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      appBar: AppBar(
          backgroundColor: kwhiteColor,
          elevation: 2,
          automaticallyImplyLeading: false,
          title: const Text('Employee Insertion Form',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kblackColor))),
      body: SizedBox(
        height: heigth(context),
        child: Consumer<AddEmployeeProvider>(
          builder: (context, addEmployeeProvider, child) => Column(
            children: [
              20.sh,
              Expanded(
                  child: SingleChildScrollView(
                      child: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      MyTextField(
                        label: 'Name',
                        textInputType: TextInputType.name,
                        controller: addEmployeeProvider.nameController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          }
                          return null;
                        },
                      ),
                      10.sh,
                      MyTextField(
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        controller: addEmployeeProvider.emailController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          } else if (!emailValidatorRegExp.hasMatch(v)) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                      ),
                      10.sh,
                      MyTextField(
                        label: 'Phone Number',
                        textInputType: TextInputType.phone,
                        controller: addEmployeeProvider.phoneNumberController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          }
                          return null;
                        },
                      ),
                      10.sh,
                      MyTextField(
                        label: 'Salary',
                        controller: addEmployeeProvider.salaryController,
                        textInputType: TextInputType.number,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          }
                          return null;
                        },
                      ),
                      10.sh,
                      MyTextField(
                        label: 'Designation',
                        controller: addEmployeeProvider.designationController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          }
                          return null;
                        },
                      ),
                      10.sh,
                      MyTextField(
                        label: 'Joining Date',
                        controller: addEmployeeProvider.dateController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'The field is required';
                          }
                          return null;
                        },
                      ),
                      10.sh,
                    ])),
              ))),
              10.sh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(children: [
                  Expanded(
                      child: AppComponents().simpleButton(
                          text: 'Insert',
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              addEmployeeProvider.addEmployee();
                            }
                          },
                          borderColor: kblackColor)),
                  Expanded(
                      child: AppComponents().simpleButton(
                          text: 'Cancel ',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderColor: kblackColor))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
