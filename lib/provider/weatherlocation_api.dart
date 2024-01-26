import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../Screens/home_page.dart';
import 'allweatherapi_provider.dart';

class LocationApiProvider extends ChangeNotifier {
  dynamic latitude;
  dynamic longitude;
  String apiKey = 'bc36b21eee8811778a4d7f55bcbe4591';
  // late AllWeatherAPiProvider weatherDataProvider;
  // LocationApiProvider() {
  //   weatherDataProvider = AllWeatherAPiProvider();
  // }
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getWeatherData() async {
    await getCurrentLocation(); // Wait for the location to be fetched
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      String cityname = decodedData['name'];
      print(cityname);
      print(data);
      return  decodedData;
    } else {
      print('Error in API response: ${response.body}');
      return null; // Handle the error accordingly in your app
    }
  }
  Future<void> gotoNext(BuildContext context) async {
    dynamic weatherData = await getWeatherData();
    // if (weatherData != null) {
    //   await weatherDataProvider.getData(weatherData);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(weatherData: weatherData),
        ),
      );
    // }
    // else{
    //   return null;
    // }
  }

}
