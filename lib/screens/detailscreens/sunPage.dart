import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/detail_pages_widgets/detail_card_style.dart';
import '../../widgets/detail_pages_widgets/location_atfirst_row.dart';
import '../../widgets/detail_pages_widgets/maindetail_widget.dart';
import '../../widgets/sun_page_widget/arrow_widget.dart';
import '../../provider/allweatherapi_provider.dart';

class SunPage extends StatefulWidget {
  final dynamic weatherData;
  final String name;
  final Color color;
  const SunPage({Key? key, required this.name, required this.color, required this.weatherData}) : super(key: key);

  @override
  State<SunPage> createState() => _SunPageState();
}

class _SunPageState extends State<SunPage> {

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
                            Padding(
                             padding: EdgeInsets.only(top: 30),
                             child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Text('Sun Rise',style: TextStyle(fontSize: 25,color: Colors.grey.shade600),),
                                 Text('Sun Set',style: TextStyle(fontSize: 25,color: Colors.grey.shade600),),
                               ],
                             ),
                           ),
                          const Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ArrowContainer(imagePath: 'assets/images/arrowup.png',),
                                ArrowContainer(imagePath: 'assets/images/arrow_down.png'),

                              ],
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.only(top: 29),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.sunny,size: 80,color: Colors.amber,),
                                Image.asset('assets/images/cloudy.png', height: 80, width: 80),
                              ],),
                           ),
                           Padding(
                            padding:const EdgeInsets.only(top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(value.formattedSunrise,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text(value.formattedSunset,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                              ],),
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



