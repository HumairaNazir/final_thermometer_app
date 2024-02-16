import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/Screens/setting_page.dart';
import 'package:thermometer/provider/allweatherapi_provider.dart';
import 'home_page_2ndcard.dart';
import '../Icons_Widget/icon.dart';
import 'main_thermometer_images.dart';

class FirstContainer extends StatefulWidget {
  final dynamic weatherData;
  const FirstContainer({
    super.key,
    required this.weatherData,
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
    return Consumer<AllWeatherAPiProvider>(builder:
        (BuildContext context, AllWeatherAPiProvider value, Widget? child) {
         value.weatherIcon;
         value.temp;value.tempInFarenheit;
      return Container(
              height: MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icons_widgets(
                          icon: Icons.diamond_outlined,
                        ),
                      ),
                      Text(
                        '${value.cityname}, ${value.country}',
                        style: const TextStyle(color: Colors.white,fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage())),
                            child: const Icons_widgets(
                              icon: Icons.settings,
                            )),
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
                          const MainThermometerImageCode(),
                          Container(
                            padding:
                                const EdgeInsets.only(right: 20, ),
                            child: Column(
                              children: [
                                Text(
                                  ' ${value.temp.toInt()}°C\n ${value.tempInFarenheit.toInt()}°F',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Icon(
                                    value.weatherIcon,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  HomePage2ndCard(
                    weatherData: widget.weatherData,
                  )
                ],
              ),
            );



    });
  }
}


