import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:virtoxed_text/models/employee_model.dart';

import '../../utils/const.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  List<EmployeeModel> empModelList = [];
  List<EmployeeModel> searchedEmployeeList = [];
  TextEditingController searchController = TextEditingController();

  updateIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  addInEmpModelList(EmployeeModel newEmp) {
    empModelList.add(newEmp);
    notifyListeners();
  }

  addInSearchedEmpModelList(EmployeeModel newEmp) {
    searchedEmployeeList.add(newEmp);
    notifyListeners();
  }

  searchEmployee() {
    searchedEmployeeList.clear();
    notifyListeners();
    if (empModelList.isNotEmpty) {
      for (var e in empModelList) {
        if (e.name!
            .toLowerCase()
            .startsWith(searchController.value.text.trim().toLowerCase())) {
          addInSearchedEmpModelList(e);
        }
      }
    }
  }

  Future getEmployeesList() async {
    try {
      empModelList = [];
      notifyListeners();
      updateIsLoading(true);
      List<String>? empList = await getEmployeeInSharedPref(employeesList);
      if (empList == null) {
        log('no employees');
      } else {
        //log(empList.toList().toString());
        for (int i = 0; i < empList.length; i++) {
          Map<String, dynamic> empInJson = json.decode(empList[i]);
          log(empInJson['id']);
          addInEmpModelList(EmployeeModel.fromJson(empInJson));
        }
      }
      updateIsLoading(false);
      notifyListeners();
    } catch (e) {
      log(e.toString());
      updateIsLoading(false);
    }
  }
}
