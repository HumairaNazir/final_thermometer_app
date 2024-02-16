import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/detail_pages_widgets/detail_card_style.dart';
import '../widgets/detail_pages_widgets/maindetail_widget.dart';
import '../provider/allweatherapi_provider.dart';
import '../provider/image_provider.dart';
class ThermometerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, Provider.of<ImageSelectionModel>(context, listen: false).selectedImageUrl);
        return false;
      },
      child:  SafeArea(
        child: Consumer<AllWeatherAPiProvider>(
          builder: (BuildContext context, AllWeatherAPiProvider value, Widget? child) {
            value.MediaQueryy(context);
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailWidgetMain(height: value.height, name: 'Thermometer', color: Colors.blue.shade900,),
                  Container(
                    decoration:  BoxDecoration(
                      color: Colors.blue.shade900,
                    ),
                    child: DetailCardStyle(height: value.height,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child:  GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        ),
                      itemCount: Provider.of<ImageSelectionModel>(context).imageUrls.length,
                      itemBuilder: (context, index) {
                        return Consumer<ImageSelectionModel>(
                          builder: (context, imageSelectionModel, child) {
                            String imageUrl = imageSelectionModel.imageUrls[index];
                            bool isSelected = imageSelectionModel.selectedImageUrl == imageUrl;
                            return GestureDetector(
                              onTap: () {
                                imageSelectionModel.selectImage(imageUrl);
                              },
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: isSelected ? Colors.blue.shade900 : Colors.grey,
                                    width: 3.0,
                                  ),

                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.asset(
                                    imageUrl,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                        )
                    ),
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}















// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Setting Page'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: Provider.of<ImageSelectionModel>(context).imageUrls.length,
//         itemBuilder: (context, index) {
//           return Consumer<ImageSelectionModel>(
//             builder: (context, imageSelectionModel, child) {
//               String imageUrl = imageSelectionModel.imageUrls[index];
//               bool isSelected = imageSelectionModel.selectedImageUrl == imageUrl;
//
//               return GestureDetector(
//                 onTap: () {
//                   imageSelectionModel.selectImage(imageUrl);
//                   Navigator.pop(context, imageUrl); // Pass the selected image URL back to the first page
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     border: Border.all(
//                       color: isSelected ? Colors.blueAccent : Colors.grey,
//                       width: 2.0,
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(6.0),
//                     child: Image.asset(
//                       imageUrl,
//
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }












