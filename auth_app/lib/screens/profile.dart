import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),
      ),
      body: Center(
        child: Column(children:[
          Text('Name: ${user.name}'),
          Text('Username: ${user.username}'),
          Text('Email: ${user.email}'),
        ]),
      ),
    );
  }
  
}

