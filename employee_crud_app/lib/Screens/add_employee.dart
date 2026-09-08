import 'package:employee_crud_app/Models/employee.dart';
import 'package:flutter/material.dart';
import '../Services/employee_service.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  AddEmployeeScreenState createState() => AddEmployeeScreenState();
}

class AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  void handleSubmit() {
    final employee = Employee(
      id: '',
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      department: departmentController.text,
      role: roleController.text,
      salary: salaryController.text,
    );
    EmployeeService.addEmployee(employee);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          TextField(
            controller: departmentController,
            decoration: const InputDecoration(labelText: 'Department'),
          ),
          TextField(
            controller: roleController,
            decoration: const InputDecoration(labelText: 'Role'),
          ),
          TextField(
            controller: salaryController,
            decoration: const InputDecoration(labelText: 'Salary'),
          ),
          const SizedBox(height: 16),
          TextButton(onPressed: handleSubmit, child: const Text('Add Employee')),
        ],
      ),
    );
  }
}

