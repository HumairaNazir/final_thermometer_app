import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/Widgets/card_widget.dart';
import 'package:thermometer/provider/weatherlocation_api.dart';

class IntroSecond extends StatefulWidget {
  const IntroSecond({Key? key}) : super(key: key);

  @override
  State<IntroSecond> createState() => _IntroSecondState();
}

class _IntroSecondState extends State<IntroSecond> {
  bool _loading = false;

  void _handleContinue() async {
    setState(() {
      _loading = true;
    });

    // Simulate a delay
    await Future.delayed(Duration(seconds: 2));

    // Perform navigation
    context.read<LocationApiProvider>().gotoNext(context);

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationApiProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          body: Stack(
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
                subHeading:
                    'Weather forecast, Air Quality, UV index\nCompass, Humidity',
                callback: _handleContinue,
                loading: _loading, // Pass loading state
              ),
            ],
          ),
        );
      },
    );
  }
}
