import 'package:ebeldi/common/widgets/loader.dart';
import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/home/services/home_services.dart';
import 'package:ebeldi/features/invit/services/home_services_inv.dart';
import 'package:ebeldi/features/product_details/screens/product_details_screen.dart';
import 'package:ebeldi/models/product.dart';
import 'package:flutter/material.dart';

import '../../product_details/screens/product_details_screen_Inv.dart';
import '../../search/widget/searched_product.dart';

class CategoryDealsScreenInv extends StatefulWidget {
  static const String routeName = '/category-dealsInv';
  final String category;
  const CategoryDealsScreenInv({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreenInv> createState() => _CategoryDealsScreenInvState();
}

class _CategoryDealsScreenInvState extends State<CategoryDealsScreenInv> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productList!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreenInv.routeName,
                            arguments: productList![index],
                          );
                        },
                        child: SearchedProduct(
                          product: productList![index],
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
