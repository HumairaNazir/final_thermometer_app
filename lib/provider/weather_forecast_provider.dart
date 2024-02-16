import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import '../ApiModel/weather_api_model.dart';
class WeatherForecastProvider extends ChangeNotifier {
 late final WeatherData weatherData ;
 late String iconCode;
 late IconData weatherIcon = Icons.wallet ;
  late double temperatureIn =0;
 late double temperaturefeelLike =0;
late String description;
late String dayOfWeek='';
 Future<void> setWeatherForecast(WeatherData weatherData) async {
  DateTimeData(weatherData);
  calculateTemperature(weatherData);
  calculateFeelLikeTem(weatherData);
  weatherForecastDescription(weatherData);
 }

  String DateTimeData(dynamic weatherData) {
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(weatherData.dt! * 1000);
  return  dayOfWeek = DateFormat.E().format(dateTime).toUpperCase();
  }

 void calculateTemperature(dynamic weatherData) {
  temperatureIn = (weatherData.temp?.day ?? 0).toDouble();
 }

 void calculateFeelLikeTem(dynamic weatherData) {
  temperaturefeelLike = (weatherData.feelsLike?.day ?? 0).toDouble();
 }
 void weatherForecastDescription(dynamic weatherData){
    // description = weatherData.weather?[0].description;
  description = weatherData.weather?[0].main;

 }
  currentWeatherIcon(dynamic weatherData){
  iconCode = weatherData.weather?[0].icon ;
  weatherIcon = getWeatherIcon(iconCode);
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
