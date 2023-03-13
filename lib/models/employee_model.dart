// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.salary,
    this.desgination,
    this.joiningDate,
  });
  String? id;
  String? name;
  String? email;
  int? phone;
  int? salary;
  String? desgination;
  String? joiningDate;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      id: json['id'],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      salary: json["salary"],
      desgination: json["desgination"],
      joiningDate: json['joining_date']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "salary": salary,
        "desgination": desgination,
        "joining_date": joiningDate
      };

  static Map<String, dynamic> toMap(EmployeeModel emp) => {
        "id": emp.id,
        "name": emp.name,
        "email": emp.email,
        "phone": emp.phone,
        "salary": emp.salary,
        "desgination": emp.desgination,
        "joining_date": emp.joiningDate
      };

  static String encode(List<EmployeeModel> emp) => json.encode(
        emp
            .map<Map<String, dynamic>>((emp) => EmployeeModel.toMap(emp))
            .toList(),
      );

  static List<EmployeeModel> decode(String emp) =>
      (json.decode(emp) as List<dynamic>)
          .map<EmployeeModel>((item) => EmployeeModel.fromJson(item))
          .toList();
}
