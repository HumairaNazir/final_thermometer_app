import 'package:flutter/material.dart';


class ImageSelectionModel with ChangeNotifier {
  final List<String> imageUrls = [
    'assets/images/ther.png',
    'assets/images/ther5.png',
    'assets/images/ther7.png',
    'assets/images/ther8.png',


  ];
  String _selectedImageUrl = '';

  String get selectedImageUrl => _selectedImageUrl;

  void selectImage(String imageUrl) {
    _selectedImageUrl = imageUrl;
    notifyListeners();
  }

  void clearSelection() {
    _selectedImageUrl = '';
    notifyListeners();
  }
}
