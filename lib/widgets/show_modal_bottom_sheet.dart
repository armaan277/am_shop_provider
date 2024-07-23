import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'filter_content.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();
    final providerWatch = context.watch<ProductProvider>();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Text(
                  'SORT BY',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ListTileCustom(
                  onTap: () {
                    providerRead.sortHighToLow();
                    Navigator.of(context).pop();
                    providerRead.isFiltersDataChange('PRICE: HIGH TO LOW');
                  },
                  icon: Icons.price_change,
                  title: 'PRICE: HIGH TO LOW',
                ),
                ListTileCustom(
                  onTap: () {
                    providerRead.sortLowToHigh();
                    Navigator.of(context).pop();
                    providerRead.isFiltersDataChange('PRICE: LOW TO HIGH');
                  },
                  icon: Icons.price_change_outlined,
                  title: 'PRICE: LOW TO HIGH',
                ),
                ListTileCustom(
                  onTap: () {
                    providerRead.sortBestRating();
                    Navigator.of(context).pop();
                    providerRead.isFiltersDataChange('RATING: BEST RATING');
                  },
                  icon: Icons.star,
                  title: 'PRICE: BEST RATING',
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterContent(
              icon: Icons.filter_list,
              title: 'Filters',
            ),
            FilterContent(
              icon: Icons.swap_vert,
              title: providerWatch.isFiltersData,
            ),
            FilterContent(
              icon: Icons.view_list,
              title: '',
            ),
          ],
        ),
      ),
    );
  }
}
