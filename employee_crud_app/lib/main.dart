import 'package:employee_crud_app/Screens/add_employee.dart';
import 'package:employee_crud_app/Screens/employee_view_detail.dart';
import 'package:flutter/material.dart';
import './Screens/employee_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee CRUD App',
      initialRoute: '/',
      routes: {
        '/': (context) => const EmployeeListScreen(),
        '/employee-view-detail': (context) => const EmployeeViewDetailScreen(),
        '/add-employee': (context) => const AddEmployeeScreen(),
      },
    );
  }
}
