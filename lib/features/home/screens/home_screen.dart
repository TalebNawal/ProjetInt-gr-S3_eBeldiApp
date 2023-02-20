import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/home/widgets/address_box.dart';
import 'package:ebeldi/features/home/widgets/carousel_image.dart';
import 'package:ebeldi/features/home/widgets/deal_of_day.dart';
import 'package:ebeldi/features/home/widgets/suggestion.dart';
import 'package:ebeldi/features/home/widgets/top.dart';
import 'package:ebeldi/features/home/widgets/top_categories.dart';
import 'package:ebeldi/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../product_details/screens/product_details_screen.dart';
import '../../search/widget/searched_product.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product>? products;
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.hive,
                color: Color.fromARGB(255, 60, 94, 32),
                size: 23,
              ),
              const Text(
                ' eBeldi    ',
                style: TextStyle(
                  color: Color.fromARGB(255, 60, 94, 32),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  height: 35,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Chercher un produit',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            CarouselImage(),
            Top(),
            SizedBox(height: 10),
            TopCategories(),
            SizedBox(height: 10),
            Suggestion(),
            DealOfDay(),
            /* Expanded(
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
                    child: SearchedProduct(
                      product: products![index],
                    ),
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
