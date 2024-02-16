import 'package:flutter/material.dart';
class RattingButtons extends StatelessWidget {
  final String text;
  final Color color;
  const RattingButtons({
    super.key, required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Set the button color to blue
          fixedSize: const Size(110, 50), // Set the size of the button
        ),
        child:  Text(
            text,
            style:TextStyle(
                color: text == 'Cancel' ? Colors.black : Colors.white
            )
        )
    );
  }
}