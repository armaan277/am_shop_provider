import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldCustom extends StatelessWidget {
  final VoidCallback onPressed;
  const TextFieldCustom({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        cursorColor: AppColors.mainAppColor,
        onChanged: (value) {
          onPressed();
        },
        controller: providerRead.searchController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainAppColor),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 25,
          ),
          hintText: 'Search...',
          isDense: true,
          border: OutlineInputBorder(),
          suffixIcon: providerRead.searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    providerRead.isSearchIconShow();
                  },
                  icon: Icon(Icons.close),
                )
              : null,
        ),
      ),
    );
  }
}
