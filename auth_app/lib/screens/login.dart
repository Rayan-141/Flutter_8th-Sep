import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text('Login')),
      body: Column(children: [Text('Login')]),
      );
  }

}

