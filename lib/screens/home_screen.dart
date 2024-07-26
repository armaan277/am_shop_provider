import 'package:am_shop_provider/app_drawer.dart';
import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/shopping_bag_screen.dart';
import 'package:am_shop_provider/widgets/home_chip_selector.dart';
import 'package:am_shop_provider/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/build_products_listview.dart';
import '../widgets/show_modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();
    final providerWatch = context.watch<ProductProvider>();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: Text('AM SHOP!'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ShoppingBagScreen();
              }));
            },
            icon: Badge(
              label: Text(providerWatch.cartCounts.toString()),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            height: 60,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                HomeChipSelector(
                  title: 'All',
                  select: providerRead.select == 'All' ? 'select' : '',
                  onTap: () {
                    providerRead.selectCategory('All');
                  },
                ),
                HomeChipSelector(
                  title: "Men's",
                  onTap: () {
                    providerRead.selectCategory("men's clothing");
                  },
                  select:
                      providerRead.select == "men's clothing" ? 'select' : '',
                ),
                HomeChipSelector(
                  title: "Women's",
                  onTap: () {
                    providerRead.selectCategory("women's clothing");
                  },
                  select:
                      providerRead.select == "women's clothing" ? 'select' : '',
                ),
                HomeChipSelector(
                  title: 'Jewelery',
                  onTap: () {
                    providerRead.selectCategory('jewelery');
                  },
                  select: providerRead.select == 'jewelery' ? 'select' : '',
                ),
                HomeChipSelector(
                  title: 'Electronics',
                  onTap: () {
                    providerRead.selectCategory('electronics');
                  },
                  select: providerRead.select == 'electronics' ? 'select' : '',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ShowModalBottomSheet(),
          SizedBox(height: 10),
          TextFieldCustom(
            onPressed: () {
              setState(() {});
            },
          ),
          Expanded(
            child: BuildProductsListview(),
          ),
        ],
      ),
    );
  }
}
