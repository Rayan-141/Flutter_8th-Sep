import 'package:flutter/material.dart';
import '../Models/employee.dart';
import '../Services/employee_service.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  EmployeeListScreenState createState() => EmployeeListScreenState();
}

class EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> employees = [];

  void loadEmployeeData() {
    EmployeeService.find().then((value) {
      setState(() {
        employees = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadEmployeeData();
  }

  void handleDelete(String id) async {
    await EmployeeService.findByIdAndDelete(id);
    loadEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List Screen')),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return ListTile(
            title: Text(employee.name),
            subtitle: Text(employee.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => handleDelete(employee.id),
                  icon: const Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.pushNamed(
                      context,
                      '/employee-view-detail',
                      arguments: Employee(
                        id: employee.id,
                        name: employee.name,
                        username: employee.username,
                        email: employee.email,
                        password: employee.password,
                        department: employee.department,
                        role: employee.role,
                        salary: employee.salary,
                      ),
                    ),
                  },
                  icon: const Icon(Icons.visibility),
                ),
                IconButton(
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      '/edit-employee',
                      arguments: Employee(
                        id: employee.id,
                        name: employee.name,
                        username: employee.username,
                        email: employee.email,
                        password: employee.password,
                        department: employee.department,
                        role: employee.role,
                        salary: employee.salary,
                      ),
                    );
                    loadEmployeeData();
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add-employee');
          loadEmployeeData();
        },
      ),
    );
  }
}

