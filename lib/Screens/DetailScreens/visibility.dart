import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/DetailPageWidgets/detail_card_style.dart';
import '../../Widgets/DetailPageWidgets/location_atfirst_row.dart';
import '../../Widgets/DetailPageWidgets/maindetail_widget.dart';
import '../../provider/allweatherapi_provider.dart';

class VisibilityPage extends StatefulWidget {
  final dynamic weatherData;
  final String name;
  final Color color;
  const VisibilityPage({Key? key, required this.name, required this.color,required this.weatherData}) : super(key: key);

  @override
  State<VisibilityPage> createState() => _VisibilityPageState();
}

class _VisibilityPageState extends State<VisibilityPage> {

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
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RowgetLocation(value: value,),
                            Padding(
                              padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              CircleContainerWidget(visibilitykm:'${value.visibilityKilometers.toStringAsFixed(2)}\n km', color2: Colors.deepOrange,color3: Colors.yellow,),
                                CircleContainerWidget(visibilitykm:'${value.visibilityMiles.toStringAsFixed(2)}\nMi', color2: Colors.purple,color3: Colors.purpleAccent,),
                              ],),
                            )
                        ],
                      ),
                    ),),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}

class CircleContainerWidget extends StatelessWidget {
  final String? visibilitykm;
  final String ?visibilityMi;
  final Color color2;
  final Color color3;
  const CircleContainerWidget({
    super.key, this.visibilitykm,  this.visibilityMi,
    required this.color2, required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    width: MediaQuery.of(context).size.width*0.4,
    height: MediaQuery.of(context).size.width*0.4,
    decoration:   BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          color2,
          color3
        ],
          begin: const FractionalOffset(1.0,0.0),
          end: const FractionalOffset(0.0,1.0),
          stops: const [0.0,1.0]
      ),
    ),
    child: Container(
      margin: const EdgeInsets.all(20), // Adjust the margin to control the border width
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child:   Center(
        child: Text(
          visibilitykm!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
                              );
  }
}
