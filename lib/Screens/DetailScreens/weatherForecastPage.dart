import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Widgets/DetailPageWidgets/detail_card_style.dart';
import '../../Widgets/DetailPageWidgets/location_atfirst_row.dart';
import '../../Widgets/DetailPageWidgets/maindetail_widget.dart';
import '../../provider/allweatherapi_provider.dart';


class WeatherForecastPage extends StatefulWidget {
  final dynamic weatherData;
  final String name;
  final Color color;
  const WeatherForecastPage({Key? key, required this.name, required this.color,required this.weatherData}) : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {

  @override
  Widget build(BuildContext context) {

    return   SafeArea(
      child: Consumer<AllWeatherAPiProvider>(
        builder: (BuildContext context, AllWeatherAPiProvider value, Widget? child) {
          value.MediaQueryy(context);
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailWidgetMain(height: value.height, name: widget.name, color: widget.color,),
                Container(
                  decoration:  BoxDecoration(
                    color: widget.color,
                  ),
                  child: DetailCardStyle(height: value.height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RowgetLocation(value: value,)

                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
