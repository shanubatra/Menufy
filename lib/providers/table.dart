import 'package:flutter/cupertino.dart';

class TableNo with ChangeNotifier {
  final List<int> _tableNo = [];

  List<int> get tableNo {
    return [..._tableNo];
  }

  void addTabale(int t) {
    _tableNo.add(t);
    notifyListeners();
  }
}
