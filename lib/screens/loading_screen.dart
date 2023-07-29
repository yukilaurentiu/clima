import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services//location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var token = dotenv.env['TOKEN'];

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('this line of code is triggered');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$token&units=metric');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
    )));
  }
}
