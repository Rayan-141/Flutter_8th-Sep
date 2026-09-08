import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Show Hide App",
      home: ShowHideScreen(),
    );
  }
}

class ShowHideScreen extends StatefulWidget {
  @override
  State<ShowHideScreen> createState() => ShowHideScreenState();
}

class ShowHideScreenState extends State<ShowHideScreen> {
  bool visible = true;

  void showText() {
    setState(() {
      visible = true;
    });
  }

  void hideText() {
    setState(() {
      visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Hide Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (visible)
              Text(
                "Flutter Developer",
                style: TextStyle(fontSize: 24),
              ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: showText,
                  child: Text("Show"),
                ),

                TextButton(
                  onPressed: hideText,
                  child: Text("Hide"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}