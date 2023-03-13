import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:virtoxed_text/models/employee_model.dart';

import '../../utils/const.dart';

class UpdateEmployeeProvider extends ChangeNotifier {
  String empId = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  setInitialValues(EmployeeModel emp) {
    empId = emp.id!;
    nameController.text = emp.name!;
    emailController.text = emp.email!;
    phoneNumberController.text = emp.phone!.toString();
    salaryController.text = emp.salary!.toString();
    designationController.text = emp.desgination!;
    dateController.text = emp.joiningDate!;
    notifyListeners();
  }

  Future<bool> updateEmployee() async {
    try {
      EmployeeModel newEmp = EmployeeModel(
        id: empId,
        name: nameController.value.text.trim(),
        email: emailController.value.text.trim(),
        phone: int.parse(phoneNumberController.value.text.trim()),
        salary: int.parse(salaryController.value.text.trim()),
        desgination: designationController.value.text.trim(),
        joiningDate: dateController.value.text.trim(),
      );
      List<String>? empList = await getEmployeeInSharedPref(employeesList);
      bool isUpdated = false;
      if (empList != null) {
        for (int i = 0; i < empList.length; i++) {
          Map<String, dynamic> a = json.decode(empList[i]);
          if (a['id'] == empId) {
            log('found with initial name ${a['name']}');
            String inJson = json.encode(newEmp);
            empList[i] = inJson;
            await storeEmployeeInSharedPref(employeesList, empList);
            log('updated');
            isUpdated = true;
            break;
          }
        }
        if (isUpdated) {
          showToast('Updated!');
          return true;
        } else {
          showToast('Failed!');
          return false;
        }
      } else {
        showToast("Failed!");
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
