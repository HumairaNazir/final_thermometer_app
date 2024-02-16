import 'dart:async';
import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:thermometer/Screens/intro_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // Create a timer to control the splash screen duration
    Timer(
      const Duration(seconds: 5), // Adjust the duration as needed
          () {
        // Navigate to the main content screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroPage()),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
              SizedBox(
                 height:MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.6,
                child: const Image(
                  image: AssetImage('assets/images/splash.png'),
                ),
              ),
             const Text('Smart Thermometer',style: TextStyle(
               color: Colors.indigo,fontWeight: FontWeight.bold,
               fontSize: 30
             ),
             ),
             const CircularProgressIndicator()
           ],
         ),
       ),
    );
  }
}
