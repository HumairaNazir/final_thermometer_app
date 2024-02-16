import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../ApiModel/weather_api_model.dart';
import '../screens/home_page.dart';
import 'package:permission_handler/permission_handler.dart';
class LocationApiProvider extends ChangeNotifier {
  dynamic latitude;
  dynamic longitude;
  dynamic weatherData;
  String apiKey = 'bc36b21eee8811778a4d7f55bcbe4591';
  String foreCastApiKey = 'dd6359b8920c1a71d2561dc152d6ad3f';

  Future<bool> getCurrentLocation() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        print(position);
        latitude = position.latitude;
        longitude = position.longitude;
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    } else if (permission.isDenied) {
      return false;
    } else if (permission.isPermanentlyDenied) {
      openAppSettings();
      toastMessage('You must allow location access to proceed.');
      return false;
    } else {
      return false;
    }
  }



  Future<dynamic> getWeatherData() async {
    await getCurrentLocation(); // Wait for the location to be fetched
    var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      // String cityname = decodedData['name'];
      // print(cityname);
      print(data);
      return  decodedData;
    } else {
      print('Error in API response: ${response.body}');
      return null; // Handle the error accordingly in your app
    }
  }
  Future<void> gotoNext(BuildContext context) async {
    bool locationGranted = await getCurrentLocation();

    if (locationGranted) {
      weatherData = await getWeatherData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(weatherData: weatherData),
        ),
      );
    } else {
      toastMessage('You must allow location access to proceed.');
    }
  }





  Future<WeatherApiModel> getApiWeatherForeData() async {
    await getCurrentLocation();
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      try{
        WeatherApiModel apiModel = WeatherApiModel.fromJson(data);
        return apiModel;
      }on Exception catch(e){
        print(e.toString());
        return WeatherApiModel();
      }
    } else {
      // Handle error response
      throw Exception('Failed to load data');
    }
  }
  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
