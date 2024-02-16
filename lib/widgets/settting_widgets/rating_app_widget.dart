import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thermometer/Widgets/settting_widgets/rattion_buttons.dart';

void showRatingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Rating App',textAlign:TextAlign.center ,),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.orange,
              ),
              onRatingUpdate: (rating) {
                // Handle the rating
              },
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RattingButtons(text: 'Cancel', color: Colors.grey.shade400,),
              RattingButtons(text: 'Rate', color: Colors.blue.shade900)
            ],
          )

        ],
      );
    },
  );
}

