import '../Models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeViewDetailScreen extends StatefulWidget {
  const EmployeeViewDetailScreen({super.key});

  @override
  EmployeeViewDetailScreenState createState() => EmployeeViewDetailScreenState();
}

class EmployeeViewDetailScreenState extends State<EmployeeViewDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Employee employee = ModalRoute.of(context)!.settings.arguments as Employee;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Detail View'),
      ),
      body: Column(
        children: [
          Text(employee.name),
          Text(employee.username),
          Text(employee.email),
          Text(employee.password),
          Text(employee.department),
          Text(employee.role),
          Text(employee.salary),
        ],
      ),
    );
  }
}

