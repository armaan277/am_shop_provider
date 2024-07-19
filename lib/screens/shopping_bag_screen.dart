import 'package:am_shop_provider/constant/constants.dart';
import 'package:flutter/material.dart';

class ShoppingBagScreen extends StatelessWidget {
  const ShoppingBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: Text('CART'),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.appBackgroundColor,
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                ),
              ],
            ),
            Column(
              children: [
                Text('A & M'),
                Text('Title'),
                Text('Sold by A & M Codeilm...'),
                Text('\$109.95'),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Row(
                        children: [
                          Text('Sized: M'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      child: Row(
                        children: [
                          Text('Qty: 1'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '7 days'),
                      TextSpan(text: 'return available'),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
