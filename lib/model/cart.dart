import 'package:flutter/material.dart';
import 'package:app/model/item.dart';

class Cart with ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;

  void add(Item item) {
    _items.add(item);
    _price += item.price!;
    notifyListeners();
  }

  void delet(Item item) {
    _items.remove(item);
    _price -= item.price!;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return _price;
  }

  List get items {
    return _items;
  }
}
