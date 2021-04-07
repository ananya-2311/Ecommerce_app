import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final int price;
  final String picture;
  final String size;
  final String color;

  CartItem(
      {@required this.id,
        @required this.name,
        @required this.quantity,
        @required this.price,
        @required this.picture,
      @required this.size,
      @required this.color});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtid, String name, int price, String size, String color) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
              (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              size: existingCartItem.size,
              color: existingCartItem.color));
    } else {
      _items.putIfAbsent(
          pdtid,
              () => CartItem(
            name: name,
            id: DateTime.now().toString(),
            quantity: 1,
            price: price,
          ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
              (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
                  name: existingCartItem.name,
                  quantity: existingCartItem.quantity - 1,
                  picture: existingCartItem.picture,
                  price: existingCartItem.price,
                  size: existingCartItem.size,
                  color: existingCartItem.color));
    }
    notifyListeners();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
