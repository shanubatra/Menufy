import 'package:flutter/cupertino.dart';

class CarouselImages with ChangeNotifier {
  final List<String> _images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.png'
  ];

  List<String> get images {
    return [..._images];
  }
}
