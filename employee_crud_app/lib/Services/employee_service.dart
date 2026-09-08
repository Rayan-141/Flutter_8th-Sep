import 'dart:convert';
import 'package:employee_crud_app/Models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  static const String API_URL = 'http://localhost:4000/employees/';

  static Future<void> addEmployee(Employee employee) async {
    await http.post(
      Uri.parse(API_URL),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employee.toJson()),
    );
  }

  static Future<void> editEmployee(Employee employee) async {
    await http.put(
      Uri.parse('${API_URL}${employee.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employee.toJson()),
    );
  }

  static Future<void> findByIdAndDelete(String id) async {
    await http.delete(Uri.parse('${API_URL}${id}'));
  }

  static Future<List<Employee>> find() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Employee.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  static Future<Employee> getEmployeeById(String id) async {
    final response = await http.get(Uri.parse('${API_URL}${id}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Employee.fromJson(data);
    } else {
      throw Exception('Failed to load employee');
    }
  }
}

