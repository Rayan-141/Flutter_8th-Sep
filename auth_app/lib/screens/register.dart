import 'dart:async';
import 'package:auth_app/services/user_service.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/custom_alert_box.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleRegister() async{
    User user = User(
      id: '',
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      final response = await UserService.register(user);
      if (!mounted) return;

      final message = response['message'] ?? response['error'] ?? 'Registration failed';
      if (response['message'] == 'User created successfully') {
        CustomAlertBox.showSuccess(context, 'Success', message);
        Timer(
          const Duration(seconds: 2),
          () {
            if (mounted) Navigator.pushNamed(context, '/login');
          },
        );
      } else {
        CustomAlertBox.showError(context, 'Error', message);
      }
    } catch (error) {
      if (mounted) {
        CustomAlertBox.showError(context, 'Error', 'Unable to connect to the server');
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextButton(
            onPressed: (){
              handleRegister();
            }, 
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}


