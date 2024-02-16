import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIconWidget extends StatelessWidget {
  final IconData weatherIconData; // Change the type to IconData
  final double size;
  final Color? color;

  const WeatherIconWidget( {
    Key? key,
     required this.weatherIconData,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      weatherIconData, // Use the IconData directly
      size: size,
      color: color,
    );
  }
}
