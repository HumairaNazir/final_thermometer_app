import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/provider/allweatherapi_provider.dart';
class HomePage2ndCard extends StatelessWidget {
  final dynamic weatherData;
  const HomePage2ndCard({
    super.key, required this.weatherData,
  });
  @override
  Widget build(BuildContext context) {
    return  Consumer<AllWeatherAPiProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return  Padding(
          padding: const EdgeInsets.only(top: 16,left: 9,right: 9,bottom: 2),
          // padding: const EdgeInsets.only(top: 16,left: 9,right: 9,bottom: 2),
          child: Container(
            height: MediaQuery.of(context).size.height *0.12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
            ),
            child:  Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        const Text('UV Index',style:   TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,fontSize:16 ),),
                        const Text('???',style:   TextStyle(
                            fontWeight: FontWeight.bold,fontSize:14 ),),
                        Image.asset('assets/images/uv.jpg', height: MediaQuery.of(context).size.height *0.03,),
                      ],
                    ),
                  ),
                 IntrinsicHeight(
                    child:Column(
                      children: [
                        const  Text('Feel like',style: TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,fontSize:16 ),),
                        Text('${value.feelLike.toInt()}° C\n ${value.tempInFarenheit.toInt()}° F',style:  const    TextStyle(
                            fontWeight: FontWeight.bold,fontSize:14 ),),
                      ],
                    ),),
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        const Text('Humidity',style:   TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,fontSize:16 ),),
                         Text('${value.humidity}%',style: const  TextStyle(
                            fontWeight: FontWeight.bold,fontSize:14 ),),
                        Image.asset('assets/images/humidity.jpg', height: MediaQuery.of(context).size.height *0.03,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}

