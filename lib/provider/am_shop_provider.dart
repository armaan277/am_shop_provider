import 'dart:convert';

import 'package:am_shop_provider/model/am_shop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  int cartCounts = 0;

  List<Product> cartProducts = [];

  String select = 'All';

  void getData() async {
    Response response =
        await get(Uri.parse('https://fakestoreapi.com/products'));

    debugPrint('response : ${response.body}');

    final mapResponse = jsonDecode(response.body);
    debugPrint('mapResponse : $mapResponse');

    for (int i = 0; i < mapResponse.length; i++) {
      products.add(Product.fromMap(mapResponse[i]));
    }
    notifyListeners();
  }

  void cartCountsPlus() {
    cartCounts++;
    notifyListeners();
  }

  void cartCountsMinus() {
    cartCounts--;
    notifyListeners();
  }

  void removeCart(int index) {
    cartProducts.removeAt(index);
    notifyListeners();
  }

  void selectCategory(String newSelect) {
    select = newSelect;
    notifyListeners();
  }
  
}
