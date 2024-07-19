import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({super.key});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {
  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: Text('CART'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: providerRead.cartProducts.length,
                itemBuilder: (context, index) {
                  final cartProducts = providerRead.cartProducts[index];
                  return Container(
                    color: AppColors.appBackgroundColor,
                    height: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.white,
                              width: 160,
                              child: Image.network(
                                cartProducts.image,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('A & M'),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                cartProducts.title,
                              ),
                              Text('Sold by A & M Codeilm...'),
                              Text('\$${cartProducts.price}'),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4.0),
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Text('Sized: M'),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4.0),
                                    color: Colors.white,
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
                        ),
                        IconButton(
                          onPressed: () {
                            providerRead.removeCart(index);
                            providerRead.cartCountsMinus();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
