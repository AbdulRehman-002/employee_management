import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtoxed_text/utils/colors.dart';

const String employeesList = 'employees-list';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heigth(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Future storeEmployeeInSharedPref(String keyName, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(keyName, value);
}

//getting value from share pref providing [key name]
Future<List<String>?> getValueInSharedPref(String keyName) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(keyName);
}

//getting value from share pref providing [key name]
Future<List<String>?> getEmployeeInSharedPref(String keyName) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(keyName);
}

/// Clear object in Shared Pref
Future clearInSharedPref(String keyName) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(keyName);
}

showToast(String message, {Color? color}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color ?? primaryColor,
    textColor: kwhiteColor,
    fontSize: 16,
  );
}
