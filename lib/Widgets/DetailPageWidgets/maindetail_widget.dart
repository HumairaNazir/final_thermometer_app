import 'package:flutter/material.dart';


class DetailWidgetMain extends StatelessWidget {
  final String name;
  final Color color;
  const DetailWidgetMain({
    super.key,
    required this.height, required this.name,
    required this.color,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height* 0.12,
      decoration:   BoxDecoration(
        color: color,
      ),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
                // Handle back button press here
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                name,
                style: const TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
          ]
      ),
    );
  }
}
