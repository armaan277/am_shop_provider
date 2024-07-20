import 'package:am_shop_provider/constant/constants.dart';
import 'package:am_shop_provider/provider/am_shop_provider.dart';
import 'package:am_shop_provider/screens/info_screen.dart';
import 'package:am_shop_provider/screens/shopping_bag_screen.dart';
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
  TextEditingController searchController = TextEditingController();

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
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
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
          Expanded(
            child: buildProductsListView(context),
          ),
        ],
      ),
    );
  }

  Widget buildProductsListView(BuildContext context) {
    final providerRead = context.read<ProductProvider>();

    final search = providerRead.select == 'All'
        ? providerRead.products
            .where((ele) => ele.title.contains(searchController.text))
            .toList()
        : providerRead.products.where((ele) {
            return ele.title.contains(searchController.text) &&
                ele.category == providerRead.select;
          }).toList();

    return ListView.builder(
      itemCount: search.length,
      itemBuilder: (context, index) {
        final product = search[index];

        final contains = !providerRead.cartProducts.contains(product);

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return InfoScreen(product: product);
            }));
          },
          child: 
          Container(
            margin: EdgeInsets.all(8.0),
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
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '⭐ ${product.rating.rate} / ${product.rating.count}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black54,
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
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
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
