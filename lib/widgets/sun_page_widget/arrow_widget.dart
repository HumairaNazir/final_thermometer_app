import 'package:flutter/material.dart';
class ArrowContainer extends StatelessWidget {
  final String imagePath;
  const ArrowContainer({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xff30cfd0),
            Color(0xff330867),
          ],
          begin: FractionalOffset(1.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
          stops: [0.2, 1.0],
        ),
      ),
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcATop,
        ),
        child: Image.asset(
          imagePath,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}