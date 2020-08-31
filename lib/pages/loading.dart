import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'loading';
  void setupWorldTime()async{
    WorldTime instance = WorldTime(location: 'Istanbul',flag: 'Turkey.png',url: 'Europe/Istanbul');
    await instance.getTime();
 //   print(instance.time);
//    setState(() {
 //     time = instance.time;
  //  });
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitPumpingHeart(
           color: Colors.white,
           size: 80.0,
    ),
        ),
        );

  }
}