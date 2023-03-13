import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtoxed_text/models/employee_model.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/utils/const.dart';
import 'package:virtoxed_text/utils/sized_box.dart';
import 'package:virtoxed_text/views/home/home_provider.dart';
import 'package:virtoxed_text/views/home/home_screen.dart';
import 'package:virtoxed_text/views/update_employee/update_employee_provider.dart';

import '../../app_components/app_components.dart';
import '../../app_components/textformfield.dart';

class UpdateEmployeeScreen extends StatefulWidget {
  EmployeeModel employeeModel;
  UpdateEmployeeScreen({Key? key, required this.employeeModel})
      : super(key: key);

  @override
  State<UpdateEmployeeScreen> createState() => _UpdateEmployeeScreenState();
}

class _UpdateEmployeeScreenState extends State<UpdateEmployeeScreen> {
  @override
  void initState() {
    function();
    super.initState();
  }

  function() {
    final updateProvider =
        Provider.of<UpdateEmployeeProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      updateProvider.setInitialValues(widget.employeeModel);
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      appBar: AppBar(
          backgroundColor: kwhiteColor,
          elevation: 2,
          automaticallyImplyLeading: false,
          title: const Text('Employee Updation Form',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kblackColor))),
      body: SizedBox(
        height: heigth(context),
        child: Consumer<UpdateEmployeeProvider>(
          builder: (context, updateProvider, child) => Column(
            children: [
              20.sh,
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                              key: formKey,
                              child: Column(children: [
                                MyTextField(
                                  label: 'Name',
                                  controller: updateProvider.nameController,
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
                                  controller: updateProvider.emailController,
                                  validator: (v) {
                                    if (v!.isEmpty) {
                                      return 'The field is required';
                                    } else if (!emailValidatorRegExp
                                        .hasMatch(v)) {
                                      return 'Invalid email address';
                                    }
                                    return null;
                                  },
                                ),
                                10.sh,
                                MyTextField(
                                  label: 'Phone Number',
                                  controller:
                                      updateProvider.phoneNumberController,
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
                                  controller: updateProvider.salaryController,
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
                                  controller:
                                      updateProvider.designationController,
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
                                    controller: updateProvider.dateController,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'The field is required';
                                      }
                                      return null;
                                    }),
                                10.sh,
                              ]))))),
              10.sh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: AppComponents().simpleButton(
                            text: 'Save',
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                bool? res =
                                    await updateProvider.updateEmployee();
                                log(res.toString());
                                if (res) {
                                  if (!mounted) return;
                                  await context
                                      .read<HomeProvider>()
                                      .getEmployeesList();
                                  if (!mounted) return;
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                }
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
