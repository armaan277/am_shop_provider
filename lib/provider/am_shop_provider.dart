import 'dart:convert';
import 'package:am_shop_provider/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  bool isDataLoading = true;

  int cartCounts = 0;

  List<Product> cartProducts = [];

  String select = 'All';

  TextEditingController searchController = TextEditingController();

  String isFiltersData = 'No Filters';

  void getData() async {
    Response response =
        await get(Uri.parse('https://fakestoreapi.com/products'));

    debugPrint('response : ${response.body}');

    final mapResponse = jsonDecode(response.body);
    debugPrint('mapResponse : $mapResponse');

    for (int i = 0; i < mapResponse.length; i++) {
      products.add(Product.fromMap(mapResponse[i]));
    }

    isDataLoading = false;
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

  void sortHighToLow() {
    for (int i = 0; i < products.length - 1; i++) {
      for (int j = 0; j < products.length - i - 1; j++) {
        if (products[j].price < products[j + 1].price) {
          Product temp = products[j];
          products[j] = products[j + 1];
          products[j + 1] = temp;
        }
      }
    }
    notifyListeners();
  }

  void sortLowToHigh() {
    for (int i = 0; i < products.length - 1; i++) {
      for (int j = 0; j < products.length - i - 1; j++) {
        if (products[j].price > products[j + 1].price) {
          Product temp = products[j];
          products[j] = products[j + 1];
          products[j + 1] = temp;
        }
      }
    }
    notifyListeners();
  }

  void sortBestRating() {
    for (int i = 0; i < products.length - 1; i++) {
      for (int j = 0; j < products.length - i - 1; j++) {
        if (products[j].rating.rate < products[j + 1].rating.rate) {
          Product temp = products[j];
          products[j] = products[j + 1];
          products[j + 1] = temp;
        }
      }
    }
    notifyListeners();
  }

  void isSearchIconShow() {
    searchController.clear();
    notifyListeners();
  }

  void isFiltersDataChange(String isFiltersDataNew) {
    isFiltersData = isFiltersDataNew;
    notifyListeners();
  }
}
