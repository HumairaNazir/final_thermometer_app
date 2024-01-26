import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';


class AllWeatherAPiProvider extends ChangeNotifier{
  late double height , width;
  late String cityname,country,icon,formattedSunrise,formattedSunset;
  late double temp ,feelLike ,feelLiketempInFarenheit,
      tempInFarenheit;
  late int humidity;
  late int visibility;
   late double visibilityKilometers;
   late double  visibilityMiles;
    void MediaQueryy(BuildContext context){
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    }
  Future<void> getData(dynamic weatherData) async {
    cityname = weatherData['name'];
    country = weatherData['sys']['country'];
    temp = weatherData['main']['temp'];
    tempInFarenheit = convertToFarhenheit(temp);
    feelLike = weatherData['main']['feels_like'];
    tempInFarenheit = feelLikeconvertToFarhenheit(feelLike);
    humidity = weatherData['main']['humidity'];
     SunSetSunRise(weatherData);
    GetVisibility(weatherData);
    // notifyListeners();

  }

  double convertToFarhenheit(double tempInCelsius) {
    return (tempInCelsius * 9 / 5) + 32;
  }
  double feelLikeconvertToFarhenheit(double feeltempInCelsius) {
    return (feeltempInCelsius * 9 / 5) + 32;
  }

  void SunSetSunRise(dynamic weatherData) {
    int sunriseTimestamp = weatherData['sys']['sunrise'];
    int sunsetTimestamp = weatherData['sys']['sunset'];

    // Convert timestamps to DateTime objects
    DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
    DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);

    // Format DateTime objects as strings
  formattedSunrise = DateFormat('hh:mm a').format(sunriseDateTime);
  formattedSunset = DateFormat('hh:mm a').format(sunsetDateTime);

  }

  void GetVisibility(dynamic weatherData) {
    int visibilityMeters = weatherData['visibility'];
    // Convert to kilometers
      visibilityKilometers = convertMetersToKilometers(visibilityMeters);
    // Convert to miles
     visibilityMiles = convertMetersToMiles(visibilityMeters);
  }

  double convertMetersToKilometers(int meters) {
    return meters / 1000.0;
  }

  double convertMetersToMiles(int meters) {
    return meters * 0.000621371;
  }


}