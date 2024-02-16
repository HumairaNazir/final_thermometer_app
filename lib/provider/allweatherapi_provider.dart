import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

class AllWeatherAPiProvider extends ChangeNotifier{

  late double height , width;
  late String cityname,country,icon,formattedSunrise,formattedSunset;
  late double feelLike= 0;
  late double feelLiketempInFarenheit,
      tempInFarenheit;
  late double temp=0 ;
  late int humidity;
  late double wind;
  late int visibility;
   late double visibilityKilometers;
   late double  visibilityMiles;
  late String iconCode;
  late IconData weatherIcon = Icons.wallet;
  late String description='';
 late String dayOfWeek='';
 late String formattedDate;
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
    // double feelsLikeDouble = feelLike.toDouble();
    // tempInFarenheit = feelLikeconvertToFarhenheit(feelsLikeDouble);
    tempInFarenheit = feelLikeconvertToFarhenheit(feelLike);
    description = weatherData['weather'][0]['main'];
    todayDate(weatherData);
    humidity = weatherData['main']['humidity'];
     iconCode = weatherData['weather'][0]['icon'];
      weatherIcon = getWeatherIcon(iconCode);
    getWind(weatherData);
     SunSetSunRise(weatherData);
    getVisibility(weatherData);

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

    DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
    DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);

    // Format DateTime objects as strings
  formattedSunrise = DateFormat('hh:mm a').format(sunriseDateTime);
  formattedSunset = DateFormat('hh:mm a').format(sunsetDateTime);

  }
  void getWind(dynamic weatherData){
    double windSpeedInMetersPerSecond = weatherData['wind']['speed'];
    // Convert to kilometers per hour (km/h)
    wind = windSpeedInMetersPerSecond * 3.6;
  }
  void getVisibility(dynamic weatherData) {
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
void todayDate(dynamic weatherData){
  DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(
      weatherData['sys']['sunrise'] * 1000);
  dayOfWeek = DateFormat.E().format(sunrise);
  // formattedDate = DateFormat('yyyy-MM-dd').format(sunrise);
}
  IconData getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.day_sunny;
      case '02d':
        return WeatherIcons.day_cloudy;
      case '03d':
        return WeatherIcons.day_cloudy_gusts;
      case '04d':
        return WeatherIcons.day_cloudy_windy;
      case '09d':
        return WeatherIcons.day_showers;
      case '10d':
        return WeatherIcons.day_rain;
      case '11d':
        return WeatherIcons.day_thunderstorm;
      case '13d':
        return WeatherIcons.day_snow;
      case '50d':
        return WeatherIcons.day_fog;
      case '01n':
        return WeatherIcons.night_clear;
      case '02n':
        return WeatherIcons.night_cloudy;
      case '03n':
        return WeatherIcons.night_cloudy_gusts;
      case '04n':
        return WeatherIcons.night_cloudy_windy;
      case '09n':
        return WeatherIcons.night_showers;
      case '10n':
        return WeatherIcons.night_rain;
      case '11n':
        return WeatherIcons.night_thunderstorm;
      case '13n':
        return WeatherIcons.night_snow;
      case '50n':
        return WeatherIcons.night_fog;
      default:
        return WeatherIcons.na;
    }
  }
}


  // WeatherIconWidget getWeatherIconWidget({double size = 50, Color? color}) {
  //   switch (currentWeatherIconCode) {
  //     case '01d':
  //       return WeatherIconWidget(
  //         size: size,
  //         color: color,
  //         weatherIconData: WeatherIcons.day_sunny,
  //       );
  //     case '01n':
  //       return WeatherIconWidget(
  //         weatherIconData:WeatherIcons.night_clear,
  //         size: size,
  //         color: color,
  //       );
  //     case '02d':
  //       return WeatherIconWidget(
  //         weatherIconData:WeatherIcons.day_cloudy,
  //         size: size,
  //         color: color,
  //       );
  //     case '02n':
  //       return WeatherIconWidget(
  //         weatherIconData: WeatherIcons.night_cloudy,
  //         size: size,
  //         color: color,
  //       );
  //   // Add more cases for other weather conditions
  //
  //     default:
  //       return WeatherIconWidget(
  //         weatherIconData: WeatherIcons.alien,
  //         size: size,
  //         color: color,
  //       );
  //   }
  // }
