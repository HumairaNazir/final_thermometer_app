import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../ApiModel/weather_api_model.dart';
import '../screens/home_page.dart';

class LocationApiProvider extends ChangeNotifier {
  dynamic latitude;
  dynamic longitude;
  dynamic weatherData;
  String apiKey = 'bc36b21eee8811778a4d7f55bcbe4591';
  String foreCastApiKey = 'dd6359b8920c1a71d2561dc152d6ad3f';

  Future<bool> getCurrentLocation() async {
    // Check for internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      toastMessage('You must connect to the internet to proceed.');
      return false;
    }

    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude;
        longitude = position.longitude;
        return true;
      } catch (e) {
        print(e);
        toastMessage('Failed to get location: ${e.toString()}');
        return false;
      }
    } else if (permission.isDenied) {
      // Request permission again when denied
      toastMessage('Location permission is denied. Please allow it.');
      await Permission.location.request(); // Re-request permission
      return false;
    } else if (permission.isPermanentlyDenied) {
      // Open app settings if permission is permanently denied
      toastMessage(
          'Location permission is permanently denied. Please allow it in settings.');
      openAppSettings();
      return false;
    } else {
      return false;
    }
  }

  Future<dynamic> getWeatherData() async {
    await getCurrentLocation();
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(data);
      return decodedData;
    } else {
      print('Error in API response: ${response.body}');
      toastMessage('Error in fetching weather data.');
      return null;
    }
  }

  Future<void> gotoNext(BuildContext context) async {
    bool locationGranted = await getCurrentLocation();

    if (locationGranted) {
      weatherData = await getWeatherData();
      Navigator.pushReplacement(
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
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      try {
        WeatherApiModel apiModel = WeatherApiModel.fromJson(data);
        return apiModel;
      } on Exception catch (e) {
        print(e.toString());
        return WeatherApiModel();
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
