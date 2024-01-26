import 'package:flutter/material.dart';

class DetailCardStyle extends StatelessWidget {
  const DetailCardStyle({
    super.key,
    required this.height, required this.child,
  });

  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height* 0.85,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
          )
      ),
      child: child,
    );
  }
}