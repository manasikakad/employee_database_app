import 'dart:convert';
import 'package:employee_database_app/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class employeeController extends GetxController {
  getData() async {
    final apiUrl = Uri.parse('https://reqres.in/api/users?page=1');
    try {
      final response = await http.get(apiUrl);
      dynamic jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        employeeModel _employeeModel = employeeModel.fromJson(jsonData);
        // print( _employeeModel.toJson());

        return _employeeModel;
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
