import 'package:flutter/material.dart';

class SettingIconText extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String text;
  final Color color;
    SettingIconText({
    super.key, required this.icon, required this.text, required this.color,
      required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9)
        ),
        padding: EdgeInsets.all(20),
        child:  InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(icon,size: 26,color: color),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(text,style: const TextStyle(fontSize: 18),),
              )
            ],
          ),
        ),
      ),
    );
  }
}