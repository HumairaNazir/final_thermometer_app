

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/Screens/home_page.dart';
import 'package:thermometer/Widgets/card_widget.dart';
import 'package:thermometer/provider/weatherlocation_api.dart';

class IntroSecond extends StatefulWidget {
  const IntroSecond({Key? key}) : super(key: key);

  @override
  State<IntroSecond> createState() => _IntroSecondState();
}

class _IntroSecondState extends State<IntroSecond> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationApiProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          body: FutureBuilder(
            future: value.gotoNext(context),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('${value.toastMessage} ${snapshot.error}');
              }
              else {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/into2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CardWidget(
                      heading: 'All in ONE',
                      subHeading: 'Weather forecast, Air Quality, UV index\n''Compass, Humidity',
                      callback: () {
                        value.gotoNext(context);
                        // Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => HomePage(weatherData: value.weatherData),
                        //       ),
                        //     );
                      },
                    ),
                  ],
                );
              }
            }

          ),
        );
      },
    );
  }
}