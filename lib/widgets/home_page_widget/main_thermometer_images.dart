import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Screens/thermometer_image.dart';
import '../../provider/image_provider.dart';

class MainThermometerImageCode extends StatelessWidget {
  const MainThermometerImageCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String? selectedImageUrl = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThermometerImage()),
        );
        if (selectedImageUrl != null) {
          // Update the selected image URL on the first page
          Provider.of<ImageSelectionModel>(context, listen: false)
              .selectImage(selectedImageUrl);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.25,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.asset(
            Provider.of<ImageSelectionModel>(context).selectedImageUrl.isNotEmpty
                ? Provider.of<ImageSelectionModel>(context).selectedImageUrl
                : 'assets/images/ther.png',fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
