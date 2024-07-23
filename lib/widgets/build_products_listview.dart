import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/info_screen.dart';
import 'package:am_shop_provider/screens/shopping_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/constants.dart';

class BuildProductsListview extends StatelessWidget {
  const BuildProductsListview({super.key});

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();

    final search = providerRead.select == 'All'
        ? providerRead.products
            .where(
                (ele) => ele.title.contains(providerRead.searchController.text))
            .toList()
        : providerRead.products.where((ele) {
            return ele.title.contains(providerRead.searchController.text) &&
                ele.category == providerRead.select;
          }).toList();

    return providerRead.isDataLoading
        ? Center(
            child: const CircularProgressIndicator(
              color: AppColors.mainAppColor,
            ),
          )
        : ListView.builder(
            itemCount: search.length,
            itemBuilder: (context, index) {
              final product = search[index];

              final contains = !providerRead.cartProducts.contains(product);

              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return InfoScreen(product: product);
                  }));
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        color: Colors.grey.shade200,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        width: 150,
                        child: Image.network(
                          product.image,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '\$ ${product.price.toDouble()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                '${product.rating.rate > 4.50 ? '⭐⭐⭐⭐⭐' : product.rating.rate > 3.50 ? '⭐⭐⭐⭐' : product.rating.rate > 2.50 ? '⭐⭐⭐' : product.rating.rate > 1.50 ? '⭐⭐' : product.rating.rate < 1 ? '⭐' : ''}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  // color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 4),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: AppColors.mainAppColor,
                                  ),
                                  onPressed: () {
                                    if (contains) {
                                      providerRead.cartProducts.add(product);
                                      providerRead.cartCountsPlus();
                                    } else {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return ShoppingBagScreen();
                                      }));
                                    }
                                  },
                                  child: Text(
                                    contains ? 'Add to Cart' : 'Go to Bag',
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
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
