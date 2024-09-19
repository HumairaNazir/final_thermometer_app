import 'package:flutter/material.dart';
import 'package:thermometer/Screens/intro_second.dart';

import '../Widgets/card_widget.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       alignment: Alignment.bottomCenter ,
       children: [
         Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/into3.jpg'),
               fit: BoxFit.cover
             )
           ),
         ),
         Positioned(
           top: 0,
           bottom: MediaQuery.of(context).size.height *0.30,
           child: Container(
             width: MediaQuery.of(context).size.width *0.40,
             decoration: const BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/images/ther.png',),
                 )
             ),

           ),
         ),
           CardWidget(heading: 'Indoor/Outdoor\n Temperature',
           subHeading: 'Check temperature by Smart Thermometer',
           callback:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroSecond()));
           })
       ],
     ),
    );
  }
}


