import 'package:am_shop_provider/constant/constants.dart';
import 'package:flutter/material.dart';

class HomeChipSelector extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String select;
  const HomeChipSelector({
    super.key,
    required this.title,
    required this.onTap,
    required this.select,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: select == 'select' ? AppColors.mainAppColor : Colors.white,
          border: select == 'select' ? Border.all(width: 0.0) : Border.all(),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: select == 'select' ? Colors.white : AppColors.mainAppColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
