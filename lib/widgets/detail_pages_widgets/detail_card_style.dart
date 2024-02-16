import 'package:flutter/material.dart';

class DetailCardStyle extends StatelessWidget {
  const DetailCardStyle({
    super.key,
    required this.height, required this.child,
     this.color =Colors.white,
  });

  final double height;
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height* 0.84,
      decoration:  BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
          )
      ),
      child: child,
    );
  }
}