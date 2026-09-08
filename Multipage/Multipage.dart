import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Profile UI",
      initialRoute: '/',
      routes: {
        '/':(context) => HomeScreen(),
        '/profile':(context) => ProfileScreen(),
        '/about':(context) => AboutScreen()
      },
    );
  }
}

class HomeScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Home page"),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/profile')}, 
              child: Text("Go To Profile Screen"),
            ),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/about')},
              child: Text("Go To About Screen"),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Home page"),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/')}, 
              child: Text("Go To Home Screen"),
            ),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/about')},
              child: Text("Go To About Screen"),
            )
          ],
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("About Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Home page"),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/')},
              child: Text("Go To Home Screen"),
            ),
            TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/profile')}, 
              child: Text("Go To Profile Screen"),
            )
          ],
        ),
      ),
    );
  }
}

