import 'package:flutter/material.dart';

import '../Widgets/Icons_Widget/card_icons.dart';
import '../Widgets/HomePageWidget/homePageFirstCard.dart';
class HomePage extends StatefulWidget {
  final dynamic weatherData;
  const HomePage({Key? key, required this.weatherData}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.orange,
              gradient: LinearGradient(
                  colors: [
                    Color(0xff30cfd0),Color(0xff330867)
                  ],
                  begin: FractionalOffset(1.0,0.0),
                  end: FractionalOffset(0.0,1.0),
                  stops: [0.0,1.0]
              )
          ),
          child:   Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0,bottom: 10.0),
                child: FirstContainer(weatherData: widget.weatherData,),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0,bottom: 10.0),
                child: CardIcon(weatherData: widget.weatherData,),
              )
            ],
          )
        ),
      ),
    );
  }
}




