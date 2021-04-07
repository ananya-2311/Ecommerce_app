import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String picture;
  final String name;
  final String description;
  final String size;
  final String color;
  final String quantity;
  final double price;
  final double old_price;


  Product(
      {@required this.id,
        @required this.picture,
        @required this.name,
        @required this.description,
        @required this.size,
        @required this.price,
        @required this.color,
        @required this.quantity,
        @required this.old_price,
        });
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: '1',
      name: "Red Dress",
      picture: "images/products/red_dress.jpg",
      description: "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
      old_price: 1199,
      price: 999,
      size: "M",
      color: "Red",
      quantity: "1",
    ),
    Product(
      id: '2',
      name: "Black Blazer",
      picture: "images/products/blazer_black.jpg",
      old_price: 2499,
      price: 1499,
      size: "L",
      color: "Black",
      quantity: "1",

    ),
    Product(
      id: '3',
      name: "Blue Top",
      picture: "images/products/blue_top.jpeg",
      old_price: 1299,
      price: 799,
      size: "M",
      color: "Blue",
      quantity: "1",
    ),
    Product(
      id: '4',
      name: "Party Frock",
      picture: "images/products/girl_frock.jpg",
      old_price: 2299,
      price: 1299,
      size: "S",
      color: "Peach",
      quantity: "1",
    ),
    Product(
      id: '5',
      name: "Black Heels",
      picture: "images/products/product_heels.jpg",
      old_price: 1599,
      price: 999,
      size: "8",
      color: "Black",
      quantity: "1",
    ),
    Product(
      id: '6',
      name: "Handbag",
      picture: "images/products/handbag.jpg",
      old_price: 1999,
      price: 999,
      size: "L",
      color: "Brown",
      quantity: "1",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}
