import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AMShopApp extends StatelessWidget {
  const AMShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
