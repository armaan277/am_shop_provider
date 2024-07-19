import 'package:am_shop_provider/constant/constants.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: Text('Product Information'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Men"s Clothing',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainAppColor,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Mens Cotton Jacket',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '\$55.99',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'I would recommend that you use a Card instead of a container. You can get a natural-looking material shadow using the elevation constructor argument. Cards come with some built-in margin, and you can add more by enclosing it in a Container if you want. This will give you enough space for the shadow to be visible. You can control the color of the Card with the color constructor argument.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 55,
        color: AppColors.mainAppColor,
        child: Center(
          child: Text(
            'Add to Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
