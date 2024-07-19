import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/model/am_shop.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/shopping_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatelessWidget {
  final Product product;
  const InfoScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();
    final contains = !providerRead.cartProducts.contains(product);
    final containsWatch =
        !context.watch<ProductProvider>().cartProducts.contains(product);
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: Text('Product Information'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Image.network(
                product.image,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10.0,
                    offset: Offset(0.0, 3.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainAppColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60.0),
                          child: Text(
                            product.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: GestureDetector(
        onTap: () {
          if (contains) {
            providerRead.cartProducts.add(product);
            providerRead.cartCountsPlus();
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ShoppingBagScreen();
            }));
          }
        },
        child: Container(
          width: double.infinity,
          height: 60,
          color: AppColors.mainAppColor,
          child: Center(
            child: Text(
              containsWatch ? 'Add to Cart' : 'Go to Bag',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
