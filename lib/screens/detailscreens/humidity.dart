import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/Screens/DetailScreens/sunPage.dart';
import 'package:thermometer/Screens/intro_page.dart';
import 'package:thermometer/provider/allweatherapi_provider.dart';

import '../../widgets/detail_pages_widgets/detail_card_style.dart';
import '../../widgets/detail_pages_widgets/location_atfirst_row.dart';
import '../../widgets/detail_pages_widgets/maindetail_widget.dart';

class HumidityPage extends StatefulWidget {
  final dynamic weatherData;
  final String name;
  final Color color;
  const HumidityPage({Key? key, required this.name, required this.color,required this.weatherData}) : super(key: key);

  @override
  State<HumidityPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<HumidityPage> {

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
                          RowgetLocation(value: value,),
                          Expanded(
                            child: Center(child:
                            Text('Humidity : ${value.humidity}%',
                              style: const TextStyle(fontSize: 30),)),
                          ),

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


