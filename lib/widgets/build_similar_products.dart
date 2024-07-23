import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/model/product.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/info_screen.dart';
import 'package:am_shop_provider/screens/shopping_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildSimilarProducts extends StatelessWidget {
  final Product product;
  const BuildSimilarProducts({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();

    final similarProducts = providerRead.products
        .where(
            (ele) => ele.category == product.category && ele.id != product.id)
        .toList();

    final providwrWatch = context.watch<ProductProvider>();

    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similarProducts.length,
        itemBuilder: (context, index) {
          final product = similarProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return InfoScreen(product: product);
              }));
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              height: 500,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 12,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: Image.network(
                        product.image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${product.rating.rate > 4.50 ? '⭐⭐⭐⭐⭐' : product.rating.rate > 3.50 ? '⭐⭐⭐⭐' : product.rating.rate > 2.50 ? '⭐⭐⭐' : product.rating.rate > 1.50 ? '⭐⭐' : product.rating.rate < 1 ? '⭐' : ''}'),
                        Text(
                          product.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Price: \$${product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'In Stock: ${product.rating.count}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.mainAppColor,
                            ),
                            onPressed: () {
                              if (!providerRead.cartProducts
                                  .contains(product)) {
                                providerRead.cartProducts.add(product);
                                providerRead.cartCountsPlus();
                              } else {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ShoppingBagScreen();
                                }));
                              }
                            },
                            child: Text(
                              !providwrWatch.cartProducts.contains(product)
                                  ? 'Add to Cart'
                                  : 'Go to Bag',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
