import 'package:flutter/material.dart';


class Myschedule with ChangeNotifier {
  List<Map> carts = [];

  void addCarts() {
    carts.add(
      {
        'barang': 'Espresso',
        'harga': 22000,
        'qty': 1,
      },
    );
    notifyListeners();
  }

  void addItem(index) {
    carts[index]['qty'] += 1;
    notifyListeners();
  }

  void removeItem(index) {
    if (carts[index]['qty'] == 1) {
      carts.removeAt(index);
    } else {
      carts[index]['qty'] -= 1;
    }
    notifyListeners();
  }

  int totalPrice() {
    int count = carts.length;
    int temp = 0;
    int a;
    for (var i = 0; i < count; i++) {
      a = carts[i]['qty'] * carts[i]['harga'];
      temp += a;
    }
    return temp;
  }
}
