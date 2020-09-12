import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'wait';


 void setupWorldTime() async{
   WorldTime instance = WorldTime(location: 'Kolkata', flag:'india.png', url:'Asia/Kolkata');
   await instance.getTime();  //if we declare await keyword inside any function then we make this function is async
  // print(instance.time);
  /*setState(() {
     time = instance.time;
   });*/

  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location' : instance.location,
    'flag' : instance.flag,
    'time' : instance.time,
    'isDaytime':instance.isDaytime,
  });

 }

  @override
  void initState() {
    super.initState();
   setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitFoldingCube(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}

