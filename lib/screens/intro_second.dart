import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermometer/Widgets/card_widget.dart';
import 'package:thermometer/provider/weatherlocation_api.dart';

class IntroSecond extends StatefulWidget {
  const IntroSecond({super.key});

  @override
  State<IntroSecond> createState() => _IntroSecondState();
}

class _IntroSecondState extends State<IntroSecond> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationApiProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Background image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/into2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Main content with CardWidget
              CardWidget(
                heading: 'All in ONE',
                subHeading:
                    'Weather forecast, Air Quality, UV index\nCompass, Humidity',
                callback: () =>
                    context.read<LocationApiProvider>().gotoNext(context),
                loading: value.isLoading, // Check loading state from provider
              ),
              // Progress Indicator for loading state
              // if (value.isLoading)
              //   const Center(
              //     child: CupertinoActivityIndicator(
              //       color: Colors.purple,
              //       radius: 20.0,
              //     ),
              //   ),
            ],
          ),
        );
      },
    );
  }
}
