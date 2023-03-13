import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virtoxed_text/main.dart';
import 'package:virtoxed_text/models/employee_model.dart';
import 'package:virtoxed_text/utils/const.dart';

class AddEmployeeProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool isLoading = false;

  updateLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  clearController() {
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    salaryController.clear();
    designationController.clear();
    dateController.clear();
    notifyListeners();
  }

  Future addEmployee() async {
    try {
      EmployeeModel newEmp = EmployeeModel(
        id: uuid.v1(),
        name: nameController.value.text.trim(),
        email: emailController.value.text.trim(),
        phone: int.parse(phoneNumberController.value.text.trim()),
        salary: int.parse(salaryController.value.text.trim()),
        desgination: designationController.value.text.trim(),
        joiningDate: dateController.value.text.trim(),
      );

      log(newEmp.toJson().toString());

      List<String>? empList = await getEmployeeInSharedPref(employeesList);
      if (empList == null) {
        log('no data initiallyy stored');
        String inJson = json.encode(newEmp);
        empList = [inJson];
        // Map<String, dynamic> a = json.decode(inJson);
        // log(a['id']);
        await storeEmployeeInSharedPref(employeesList, empList);
        log('employee added');
        showToast('Employee Added');
        clearController();
      } else {
        String inJson = json.encode(newEmp);

        empList.add(inJson);
        await storeEmployeeInSharedPref(employeesList, empList);
        log('employee added');
        showToast('Employee Added');
        clearController();
        List<String>? updatedempList =
            await getEmployeeInSharedPref(employeesList);
        log(updatedempList!.toList().toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
