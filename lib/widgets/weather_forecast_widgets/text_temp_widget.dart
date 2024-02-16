
import 'package:flutter/material.dart';
import 'package:thermometer/provider/allweatherapi_provider.dart';
class TextTempWidget extends StatelessWidget {
  final AllWeatherAPiProvider value;
  const TextTempWidget({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {
  print(value);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          child: RichText(
            text:   TextSpan(
              children: [
                TextSpan(
                  text: '${value.temp.toInt()}°',
                  style: TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: 'C',
                  style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 9, bottom: 40),
          child: Text(
            'Feels like ${value.feelLike.toInt()}°c',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft, // Align the child to the left
          child: const Text(
            'Another 7 Days',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}