class Employee {
  String id;
  String name;
  String username;
  String email;
  String password;
  String department;
  String role;
  String salary;

  Employee({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.department,
    required this.role,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> map) {
    return Employee(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      username: map['username']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      password: map['password']?.toString() ?? '',
      department: map['department']?.toString() ?? '',
      role: map['role']?.toString() ?? '',
      salary: map['salary']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'role': role,
      'department': department,
      'salary': salary,
    };
  }
}

