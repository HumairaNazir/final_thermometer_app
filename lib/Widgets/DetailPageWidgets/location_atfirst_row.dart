import 'package:flutter/material.dart';
class RowgetLocation extends StatelessWidget {
  final dynamic value;
  const RowgetLocation({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_on_outlined,size: 27,),
        const SizedBox(width: 20,),
        Text('${value.cityname},${value.country}',style: TextStyle(fontSize: 20),),
      ],
    );
  }
}