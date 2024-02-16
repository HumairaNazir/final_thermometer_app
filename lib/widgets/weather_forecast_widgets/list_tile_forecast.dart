import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/ApiModel/weather_api_model.dart';
import 'package:thermometer/provider/weather_forecast_provider.dart';
class ListTileForecast extends StatefulWidget {
  final WeatherData weatherData;
  const ListTileForecast({
    super.key, required this.weatherData,

  });

  @override
  State<ListTileForecast> createState() => _ListTileForecastState();
}

class _ListTileForecastState extends State<ListTileForecast> {

  @override
  void initState() {
    super.initState();
    initializeData();
  }
  Future<void> initializeData() async {
    await Provider.of<WeatherForecastProvider>(context, listen: false)
        .setWeatherForecast(widget.weatherData);
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child:  Consumer<WeatherForecastProvider>(
          builder: (BuildContext context, WeatherForecastProvider value, Widget? child) {
            print(value.currentWeatherIcon(widget.weatherData));
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value.dayOfWeek,style: TextStyle(color: Colors.grey.shade600),),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${value.temperatureIn.toInt()}°',
                          style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        TextSpan(
                          text: ' ${value.temperaturefeelLike.toInt()}°',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                   Icon(value.weatherIcon,color: Colors.grey,),
                  Text(value.description,style: TextStyle(color: Colors.grey.shade600),),

                ],
              ),
            );
          },

        )


      ),
    );
  }
}


// WeatherIcon(
// getWeatherIcon(widget.weatherData.weather![0].icon!),
// size: 50,
// color: Colors.blue,
// )