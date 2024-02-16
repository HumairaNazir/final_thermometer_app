import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:provider/provider.dart';

import '../../widgets/detail_pages_widgets/detail_card_style.dart';
import '../../widgets/detail_pages_widgets/location_atfirst_row.dart';
import '../../Widgets/detail_pages_widgets/maindetail_widget.dart';
import '../../provider/allweatherapi_provider.dart';
import 'dart:math' as math;
class CompassPage extends StatefulWidget {
  final dynamic weatherData;
  final String name;
  final Color color;
  const CompassPage({Key? key, required this.name, required this.color,required this.weatherData}) : super(key: key);

  @override
  State<CompassPage> createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  double? initialDirection;
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
                          StreamBuilder<CompassEvent>(
                              stream: FlutterCompass.events,
                              builder:(context , snapshot){
                                if(snapshot.hasError){
                                  return Text('Error reading :${snapshot.hasError}',);
                                }
                                if(snapshot.connectionState ==ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator(),
                                  );
                                }
                                double? direction = snapshot.data?.heading;
                                if(direction == null){
                                  return const Center(child: Text('Device does not have sensors'),);
                                }
                                if (initialDirection == null) {
                                  initialDirection = direction;
                                }
                                // initialDirection ??= direction;

                                double adjustedDirection = direction - initialDirection!;
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      child: Transform.rotate(
                                          // angle: direction * (math.pi /180) * -1,
                                          angle: adjustedDirection * (math.pi /180) * -1,
                                      child: Image.asset('assets/images/compass.png')),),
                                  ),
                                );
                              }
                          )
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
