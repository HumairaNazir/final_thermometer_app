import 'package:flutter/material.dart';


class IconsWidgetTile extends StatelessWidget {
  final IconData icon;
  final String  title;
  final  VoidCallback callback;
  final Color color;
  const IconsWidgetTile({
    super.key, required this.icon, required this.title, required this.color, required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: callback,
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.08,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.17,
            decoration:  const BoxDecoration(
              color: Colors.white,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))
            ),
            child: Icon(icon,color: color,size: 28,),
          ),
        ),
        Text(title,style:const TextStyle(
          color: Colors.white,
          fontSize: 16
        ),)
      ],
    );
  }
}