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

  bool _isLoading = false; // Track loading state
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Method to check internet connectivity
  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      toastMessage('You must connect to the internet to proceed.');
      return false;
    }
    return true;
  }

  // Modified getCurrentLocation with additional debug logs
  Future<bool> getCurrentLocation() async {
    print('Checking internet connectivity...');
    bool hasInternet = await _checkInternetConnection();
    if (!hasInternet) return false;

    print('Requesting location permission...');
    PermissionStatus permission = await Permission.location.request();
    print('Permission status: $permission'); // Debug log

    if (permission.isGranted) {
      print('Permission granted, getting location...');
      setLoading(true); // Show progress indicator
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        latitude = position.latitude;
        longitude = position.longitude;
        print('Location obtained: Lat: $latitude, Lon: $longitude');
        setLoading(false); // Hide progress indicator
        return true;
      } catch (e) {
        print('Error getting location: $e');
        toastMessage('Failed to get location. Please try again.');
        setLoading(false); // Hide progress indicator
        return false;
      }
    } else if (permission.isDenied || permission.isPermanentlyDenied) {
      print('Permission denied or permanently denied');
      toastMessage(
          'Location permission is denied. Please allow it to proceed.');
      openAppSettings();
      return false;
    }
    return false;
  }

  Future<dynamic> getWeatherData() async {
    bool locationGranted = await getCurrentLocation();
    if (!locationGranted) return null;

    setLoading(true); // Show progress indicator
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));
    setLoading(false); // Hide progress indicator

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
    setLoading(true); // Show progress indicator
    bool locationGranted = await getCurrentLocation();

    if (locationGranted) {
      weatherData = await getWeatherData();
      if (weatherData != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(weatherData: weatherData),
          ),
        );
      } else {
        toastMessage('Error in fetching weather data.');
      }
    } else {
      toastMessage('You must allow location access to proceed.');
    }
    setLoading(false); // Hide progress indicator
  }

  Future<WeatherApiModel> getApiWeatherForeData() async {
    // Check if we already have location data
    if (latitude == null || longitude == null) {
      await getCurrentLocation();
    }

    // If latitude or longitude is still null, it means location fetching failed
    if (latitude == null || longitude == null) {
      throw Exception('Location is not available.');
    }

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      try {
        WeatherApiModel apiModel = WeatherApiModel.fromJson(data);
        return apiModel;
      } catch (e) {
        print(e.toString());
        toastMessage('Error parsing forecast data.');
        return WeatherApiModel();
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<WeatherApiModel> getApiWeatherForeData() async {
  //   bool locationGranted = await getCurrentLocation();
  //   if (!locationGranted) throw Exception('Location permission denied');
  //
  //   setLoading(true); // Show progress indicator
  //   final response = await http.get(Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/forecast/daily?lat=$latitude&lon=$longitude&appid=$foreCastApiKey&units=metric'));
  //
  //   setLoading(false); // Hide progress indicator
  //
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     try {
  //       WeatherApiModel apiModel = WeatherApiModel.fromJson(data);
  //       return apiModel;
  //     } catch (e) {
  //       print('Error parsing forecast data: $e');
  //       toastMessage('Error parsing forecast data.');
  //       throw Exception('Error parsing forecast data');
  //     }
  //   } else {
  //     print('Failed to load data: ${response.statusCode}');
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Method to show toast messages
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
