import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/provider/weather_forecast_provider.dart';
import 'package:thermometer/provider/weatherlocation_api.dart';
import '../../ApiModel/weather_api_model.dart';
import '../../widgets/detail_pages_widgets/detail_card_style.dart';
import '../../widgets/detail_pages_widgets/location_atfirst_row.dart';
import '../../widgets/detail_pages_widgets/maindetail_widget.dart';
import '../../widgets/weather_forecast_widgets/list_tile_forecast.dart';
import '../../widgets/weather_forecast_widgets/text_temp_widget.dart';
import '../../provider/allweatherapi_provider.dart';
import '../intro_page.dart';

class WeatherForecastPage extends StatefulWidget {
  final dynamic weatherData;
  final String name;
  final Color color;
  const WeatherForecastPage(
      {Key? key,
      required this.name,
      required this.color,
      required this.weatherData})
      : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Consumer2<AllWeatherAPiProvider, LocationApiProvider>(
        builder: (BuildContext context, value, location, Widget? child) {
          value.MediaQueryy(context);
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailWidgetMain(
                  height: value.height,
                  name: widget.name,
                  color: widget.color,


                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                  ),
                  child: DetailCardStyle(
                    height: value.height,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RowgetLocation(value: value,),
                           Padding(
                            padding: EdgeInsets.all(20.0),
                            child:  Icon(value.weatherIcon, size: 50,color: Colors.grey,),
                          ),
                          TextTempWidget(value: value,),
                          FutureBuilder(
                            future: location.getApiWeatherForeData(),
                            builder: (BuildContext context, AsyncSnapshot<WeatherApiModel> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }  else if (snapshot.hasError) {

                                return Text(' ${snapshot.error}');
                              } else {
                                List<WeatherData>? weatherDataList = snapshot.data?.list;
                                if (weatherDataList == null || weatherDataList.isEmpty) {
                                  return const Center(
                                    child: Text('No weather data available'),
                                  );
                                } else {
                                    return Expanded(
                                     child: ListView.builder(
                                       itemCount: weatherDataList.length  ,
                                       itemBuilder: (BuildContext context, int index) {
                                         WeatherData weatherData = weatherDataList[index];
                                         return ListTileForecast(
                                           weatherData: weatherData,

                                         );
                                         },
                                     ),
                            );
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
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




// Provider.of<WeatherForecastProvider>(context, listen: false)
//      .setWeatherDataList(weatherDataList);
// return Expanded(
// child: Consumer<WeatherForecastProvider>(
// builder: (context, weatherProvider, child) {
// return ListView.builder(
// itemCount: weatherProvider.weatherDataList?.length ?? 0,
// itemBuilder: (BuildContext context, int index) {
// // WeatherData weatherData = weatherProvider.weatherDataList![index];
// return ListTileForecast(
// // weatherData: weatherData,
// // index: index, // Pass the index to ListTileForecast
// );
// },
// );
// },
// ),
// );




