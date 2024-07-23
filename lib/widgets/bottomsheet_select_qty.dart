import 'package:flutter/material.dart';

import '../constant/constants.dart';

class BottomsheetSelectQty extends StatefulWidget {
  const BottomsheetSelectQty({super.key});

  @override
  State<BottomsheetSelectQty> createState() => _BottomsheetSelectQtyState();
}

class _BottomsheetSelectQtyState extends State<BottomsheetSelectQty> {
  // List<int> selectQty = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int selectQty = 4;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
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
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: 55,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // for (int i = 0; i < selectQty.length; i++)
                        GestureDetector(
                          onTap: () {
                            selectQty = 1;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 1
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('1'),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            selectQty = 2;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 2
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('2'),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            selectQty = 3;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 3
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('3'),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            selectQty = 4;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 4
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('4'),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            selectQty = 5;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 5
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('5'),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            selectQty = 6;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 6
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('6'),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            selectQty = 7;
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: selectQty == 7
                                  ? Border.all(color: AppColors.mainAppColor)
                                  : Border.all(),
                            ),
                            child: Center(
                              child: Text('7'),
                            ),
                          ),
                        ),
                      ],
                    ),
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
            Text('Qty: $selectQty'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
