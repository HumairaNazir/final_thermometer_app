import 'package:flutter/material.dart';

class SettingFirstConatainer extends StatelessWidget {
  const SettingFirstConatainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height *0.2,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Thermometer',style: TextStyle(fontSize: 20),),
              Image.asset('assets/images/splash.png',)
            ],
          ),
        ),
      ),
    );
  }
}