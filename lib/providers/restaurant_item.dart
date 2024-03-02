import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Item with ChangeNotifier {
  final List<Map<String, dynamic>> _item = [
    {
      "id": 1,
      "name": "Dosa",
      "price": 100,
      "rating": "4",
      "images": "assets/images/slide1.jpg",
      "fav": false,
      "pressed": false,
      "count": 0
    },
    {
      "id": 2,
      "name": "Momos",
      "price": 80,
      "rating": "5",
      "images": "assets/images/i1.jpg",
      "fav": false,
      "pressed": false,
      "count": 0
    },
    {
      "id": 3,
      "name": "Pizza",
      "price": 90,
      "rating": "5",
      "images": "assets/images/i3.jpg",
      "fav": false,
      "pressed": false,
      "count": 0
    },
    {
      "id": 4,
      "name": "Burger",
      "price": 40,
      "rating": "4",
      "images": "assets/images/i4.jpg",
      "fav": false,
      "pressed": false,
      "count": 0
    },
    {
      "id": 5,
      "name": "Sandhwich",
      "price": 50,
      "rating": "3",
      "images": "assets/images/i5.jpg",
      "fav": false,
      "pressed": false,
      "count": 0
    },
    {
      "id": 6,
      "name": "Panner",
      "price": 250,
      "rating": "5",
      "images": "assets/images/i6.jpg",
      "fav": false,
      "pressed": false,
      "count": 0
    },
  ];

  List<Map<String, dynamic>> get items {
    return [..._item];
  }

  void updatefav(int id) {
    List<Map<String, dynamic>> k =
        _item.where((element) => element['id'] == id).toList();
  }

  void changeFav(int index) {
    if (_item[index]['fav'] == false) {
      _item[index]['fav'] = true;
    } else {
      _item[index]["fav"] = false;
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> showfav() {
    return _item.where((element) => element['fav'] == true).toList();
  }

  void changeState(int index) {
    _item[index]['pressed'] = true;

    notifyListeners();
  }

  void increment(int index) {
    _item[index]['count']++;

    notifyListeners();
  }

  void decrement(int index) {
    if (_item[index]['count'] > 0) {
      _item[index]['count']--;
    }
    if (_item[index]['count'] == 0) {
      _item[index]['pressed'] = false;
    }

    notifyListeners();
  }

  List<Map<String, dynamic>> searchItem(String val) {
    List<Map<String, dynamic>> dummy = _item
        .where((element) => element['name']
            .toString()
            .toLowerCase()
            .contains(val.toLowerCase()))
        .toList();

    return dummy;
  }

  final List<Map<String, dynamic>> _cartItem = [];

  List<Map<String, dynamic>> get cartItem {
    return [..._cartItem];
  }

  void addCart(int id) {
    List<Map<String, dynamic>> k =
        _item.where((element) => element['id'] == id).toList();

    if (_cartItem.isEmpty) {
      _cartItem.add(k[0]);
    } else if (_cartItem.any((element) => element['id'] == id)) {
      int index = _cartItem.indexWhere((element) => element['id'] == id);
    } else {
      _cartItem.add(k[0]);
    }
    // print(k);
    notifyListeners();
  }

  void removeCart(int id) {
    int index = _cartItem.indexWhere((element) => element['id'] == id);

    if (index != -1) {
      _cartItem.removeAt(index);
      List<Map<String, dynamic>> k =
          _item.where((element) => element['id'] == id).toList();

      _cartItem.insert(index, k[0]);

      if (_cartItem[index]['count'] == 0) {
        _cartItem.removeAt(index);
      }
    }

    notifyListeners();
  }

  // void changefav(int index) {
  //   if (_item[index]['fav']as String == "false") {
  //     _item[index]['fav'] = "true";
  //   } else {
  //     _item[index]['fav'] = "false";
  //   }

  //   notifyListeners();
  // }
}
