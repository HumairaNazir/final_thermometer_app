import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/provider/allweatherapi_provider.dart';

import 'homePage2ndCard.dart';
import '../Icons_Widget/icon.dart';

class FirstContainer extends StatefulWidget {
  final dynamic weatherData;
  const FirstContainer({
    super.key,required this.weatherData,
  });

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  @override
  void initState() {
    super.initState();
    initializeData();
  }
  Future<void> initializeData() async {
    await Provider.of<AllWeatherAPiProvider>(context, listen: false)
        .getData(widget.weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AllWeatherAPiProvider>(
      builder: (BuildContext context, AllWeatherAPiProvider value, Widget? child) {
        return FutureBuilder(
          future: value.getData(widget.weatherData),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error:${snapshot.error}');
            }
            else {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.50,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icons_widgets(icon: Icons.diamond_outlined,),
                        ),
                        Text('${value.cityname}, ${value.country}',
                          style: const TextStyle(color: Colors.white),),
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icons_widgets(icon: Icons.settings,),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.25,
                              child: Image.asset('assets/images/ther.png'),
                            ),

                            Container(
                              padding: const EdgeInsets.only(right: 30, bottom: 20),
                              child:  Column(
                                children: [
                                  Text('${value.temp.toInt()}° C\n ${value.tempInFarenheit.toInt()}° F',
                                    style:const TextStyle(color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                    child: Icon(
                                      Icons.cloud, size: 60,
                                      color: Colors.white,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    HomePage2ndCard(weatherData: widget.weatherData,)

                  ],
                ),
              );
            }
          },

        );
      }
    );
  }
}





