import 'package:employee_database_app/controllers/employeeController.dart';
import 'package:employee_database_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Employee Database',
      home: HomePage(),
    );
  }
}

