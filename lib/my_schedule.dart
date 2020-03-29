import 'dart:math';

import 'package:flutter/material.dart';

class Myschedule with ChangeNotifier {
  List<Map> carts = [];
  List<Map> products = [
    {
      'barang': 'Espresso',
      'harga': 18000,
    },
    {
      'barang': 'Macchiato',
      'harga': 20000,
    },
    {
      'barang': 'Latte',
      'harga': 19500,
    },
    {
      'barang': 'Cappucino',
      'harga': 25000,
    },
    {
      'barang': 'Mocca',
      'harga': 22000,
    }
  ];
    final _random = new Random();

  void addCarts() {
    var element = products[_random.nextInt(products.length)];

    carts.add(
      {
        'barang': element['barang'],
        'harga': element['harga'],
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
