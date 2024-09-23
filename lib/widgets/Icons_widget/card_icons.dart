import 'package:flutter/material.dart';
import 'package:thermometer/Screens/DetailScreens/compass.dart';
import 'package:thermometer/Screens/DetailScreens/humidity.dart';
import 'package:thermometer/Screens/DetailScreens/sunPage.dart';
import 'package:thermometer/Screens/DetailScreens/weatherForecastPage.dart';
import 'package:thermometer/Screens/DetailScreens/wind.dart';
import 'package:thermometer/Widgets/Icons_Widget/icon_subtitle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Screens/DetailScreens/visibility.dart';

class CardIcon extends StatelessWidget {
  final dynamic weatherData;
  const CardIcon({super.key, required this.weatherData});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.32,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconsWidgetTile(
                      icon: FontAwesomeIcons.cloudSun,
                      color: Colors.purple,
                      title: 'Weather\nForecast',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherForecastPage(
                                      name: 'Weather Forecast',
                                      color: Colors.purple,
                                      weatherData: weatherData,
                                    )));
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    IconsWidgetTile(
                      icon: FontAwesomeIcons.cloudSun,
                      color: Colors.orange,
                      title: 'SunTime',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SunPage(
                                      name: 'SunTime',
                                      color: Colors.orange,
                                      weatherData: weatherData,
                                    )));
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconsWidgetTile(
                      icon: Icons.opacity,
                      color: Colors.blueAccent,
                      title: 'Humidity',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HumidityPage(
                                      name: 'Humidity',
                                      color: Colors.blueAccent,
                                      weatherData: weatherData,
                                    )));
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    IconsWidgetTile(
                      icon: Icons.visibility,
                      color: Colors.purple,
                      title: 'Visibility',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VisibilityPage(
                                      name: 'Visibility',
                                      color: Colors.purple,
                                      weatherData: weatherData,
                                    )));
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconsWidgetTile(
                      icon: FontAwesomeIcons.compass,
                      color: Colors.red,
                      title: 'Compass',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompassPage(
                                      name: 'Compass',
                                      color: Colors.red,
                                      weatherData: weatherData,
                                    )));
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    IconsWidgetTile(
                      icon: Icons.waves_rounded,
                      color: Colors.blue,
                      title: 'Wind',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WindPage(
                                      name: 'Wind',
                                      color: Colors.blue,
                                      weahtherData: weatherData,
                                    )));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
