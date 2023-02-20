import 'package:ebeldi/common/widgets/loader.dart';
import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/List_Produit/widget/searched_product.dart';
import 'package:ebeldi/features/home/widgets/address_box.dart';
import 'package:ebeldi/features/product_details/screens/product_details_screen.dart';
import 'package:ebeldi/features/search/services/search_services.dart';
import 'package:ebeldi/features/search/widget/searched_product.dart';
import 'package:ebeldi/models/product.dart';
import 'package:flutter/material.dart';

import '../services/search_services.dart';

class Liste extends StatefulWidget {
  static const String routeName = '/List-screen';
  const Liste({
    Key? key,
  }) : super(key: key);

  @override
  State<Liste> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Liste> {
  List<Product>? products;
  final ListeServices searchServices = ListeServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? const Loader()
          : Column(
              children: [
                const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreen.routeName,
                            arguments: products![index],
                          );
                        },
                        child: ListProduct(
                          product: products![index],
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
