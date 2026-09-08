import 'package:auth_app/screens/home.dart';
import 'package:auth_app/screens/login.dart';
import 'package:auth_app/screens/register.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Auth App',
      initialRoute: '/',
      routes: {
        '/':(context) => HomeScreen(),
        '/login':(context) => LoginScreen(),
        '/register':(context) => RegisterScreen(),
      },
    );
  }
}

