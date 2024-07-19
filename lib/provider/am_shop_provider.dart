import 'dart:convert';

import 'package:am_shop_provider/model/am_shop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> mapResponseLists = [];

  void getData() async {
    Response response =
        await get(Uri.parse('https://fakestoreapi.com/products'));

    debugPrint('response : ${response.body}');

    final mapResponse = jsonDecode(response.body);
    debugPrint('mapResponse : $mapResponse');

    for (int i = 0; i < mapResponse.length; i++) {
      mapResponseLists.add(Product.fromMap(mapResponse[i]));
    }
    notifyListeners();
  }
}
