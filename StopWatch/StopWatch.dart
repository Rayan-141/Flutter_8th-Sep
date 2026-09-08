import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(title: "Stop Watch",home: StopWatchScreen());
  }
}

class StopWatchScreen extends StatefulWidget{
  StopWatchScreenState createState() => StopWatchScreenState();
}

class StopWatchScreenState extends State<StopWatchScreen>{
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;

  void start(){
    if(timer == null || !(timer?.isActive ?? false)){
      timer = Timer.periodic(Duration(seconds: 1), (Timer t){
        setState(() {
          seconds++;
          if(seconds==60){
            seconds=0;
            minutes++;
            if(minutes==60){
              minutes=0;
              hours++;
            }
          }
        });
      });
    }
  }

  void stop(){
    timer?.cancel();
  }

  void reset(){
    stop();
    setState(() {
      hours=0;
      minutes=0;
      seconds=0;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Stop Watch"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("$hours:$minutes:$seconds"),
            TextButton(onPressed: start, child: Text("Start")),
            TextButton(onPressed: stop, child: Text("Stop")),
            TextButton(onPressed: reset, child: Text("Reset")),
          ],
        ),
      ),   
    );
  }
}

