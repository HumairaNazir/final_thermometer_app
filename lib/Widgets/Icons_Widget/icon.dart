import 'package:flutter/material.dart';


class Icons_widgets extends StatelessWidget {
  final IconData icon;
  const Icons_widgets({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.10,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.12,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}