import 'package:flutter/material.dart';
import 'package:clima/services//location.dart';
import 'package:http/http.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print('this line of code is triggered');
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
  }

  void getData() async {
    Response response = await get( Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=a0abc3fc4722a9fbd520e3b4ec54bc02' ));
    print(response.statusCode);
  }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}
