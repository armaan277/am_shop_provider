import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/model/product.dart';
import 'package:flutter/material.dart';

class BottomsheetSelectSize extends StatefulWidget {
  final Product product;
  const BottomsheetSelectSize({
    super.key,
    required this.product,
  });

  @override
  State<BottomsheetSelectSize> createState() => _BottomsheetSelectSizeState();
}

class _BottomsheetSelectSizeState extends State<BottomsheetSelectSize> {
  // List<String> selectSize = ['S', 'M', 'L', 'XS', 'XL', 'XLL'];

  String selectSize = 'S';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 22),
                Container(
                  height: 6,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Select Size',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price: ${widget.product.price}',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Seller: ',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'A & M Hennes & Mauritz Retail Privated Limited',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // for (int i = 0; i < selectSize.length; i++)
                      GestureDetector(
                        onTap: () {
                          selectSize = 'S';
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: selectSize == 'S'
                                ? Border.all(color: AppColors.mainAppColor)
                                : Border.all(),
                          ),
                          child: Center(
                            child: Text('S'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          selectSize = 'M';
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: selectSize == 'M'
                                ? Border.all(color: AppColors.mainAppColor)
                                : Border.all(),
                          ),
                          child: Center(
                            child: Text('M'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          selectSize = 'L';
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: selectSize == 'L'
                                ? Border.all(color: AppColors.mainAppColor)
                                : Border.all(),
                          ),
                          child: Center(
                            child: Text('L'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          selectSize = 'XS';
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: selectSize == 'XS'
                                ? Border.all(color: AppColors.mainAppColor)
                                : Border.all(),
                          ),
                          child: Center(
                            child: Text('XS'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          selectSize = 'XL';
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: selectSize == 'XL'
                                ? Border.all(color: AppColors.mainAppColor)
                                : Border.all(),
                          ),
                          child: Center(
                            child: Text('XL'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          selectSize = 'XXL';
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: selectSize == 'XXL'
                                ? Border.all(color: AppColors.mainAppColor)
                                : Border.all(),
                          ),
                          child: Center(
                            child: Text('XXL'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    color: AppColors.mainAppColor,
                    child: Center(
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Colors.white,
        child: Row(
          children: [
            Text('Sized: $selectSize'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
