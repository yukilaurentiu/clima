import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services//location.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var token = dotenv.env['TOKEN'];
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;



  @override
  void initState() {
    super.initState();
    getLocationData();
    print('this line of code is triggered');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$token');

    var weatherData = await networkHelper.getData();



  }




      \

  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold();
  }
}
