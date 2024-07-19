import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/info_screen.dart';
import 'package:am_shop_provider/widgets/filter_content.dart';
import 'package:am_shop_provider/widgets/home_chip_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String select = 'All';

  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<ProductProvider>();

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainAppColor,
        title: Text('AM SHOP!'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeChipSelector(
                  title: 'All',
                  select: select == 'All' ? 'select' : '',
                  onTap: () {
                    select = 'All';
                    setState(() {});
                  },
                ),
                HomeChipSelector(
                  title: "Men's",
                  onTap: () {
                    select = 'Men';
                    setState(() {});
                  },
                  select: select == 'Men' ? 'select' : '',
                ),
                HomeChipSelector(
                  title: "Women's",
                  onTap: () {
                    select = 'women';
                    setState(() {});
                  },
                  select: select == 'women' ? 'select' : '',
                ),
                HomeChipSelector(
                  title: 'Jewelery',
                  onTap: () {
                    select = 'jewelery';
                    setState(() {});
                  },
                  select: select == 'jewelery' ? 'select' : '',
                ),
                HomeChipSelector(
                  title: 'Electronics',
                  onTap: () {
                    select = 'electronics';
                    setState(() {});
                  },
                  select: select == 'electronics' ? 'select' : '',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
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
                  title: 'No Filters',
                ),
                FilterContent(
                  icon: Icons.view_list,
                  title: '',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
                hintText: 'Search...',
                isDense: true,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: providerRead.mapResponseLists.length,
              itemBuilder: (context, index) {
                final product = providerRead.mapResponseLists[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return InfoScreen();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 150,
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Image.network(
                            product.image,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.title),
                            Text('${product.price}'),
                            Text('${product.rating.rate}'),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.mainAppColor,
                              ),
                              onPressed: () {},
                              child: Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
