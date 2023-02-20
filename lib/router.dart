import 'package:ebeldi/common/widgets/bottom_bar.dart';
import 'package:ebeldi/features/address/screens/address_screen.dart';
import 'package:ebeldi/features/admin/screens/add_product_screen.dart';
import 'package:ebeldi/features/order/screens/order_screen.dart';
import 'package:ebeldi/features/auth/screens/auth_screen.dart';
import 'package:ebeldi/features/home/screens/category_deals_screen.dart';
import 'package:ebeldi/features/home/screens/home_screen.dart';
import 'package:ebeldi/features/order_details/screens/order_details.dart';
import 'package:ebeldi/features/product_details/screens/product_details_screen.dart';
import 'package:ebeldi/features/product_details/screens/product_details_screen_Inv.dart';
import 'package:ebeldi/features/search/screens/search_screen.dart';
import 'package:ebeldi/models/order.dart';
import 'package:ebeldi/models/product.dart';
import 'package:flutter/material.dart';

import 'features/account/widgets/orders.dart';
import 'features/cart/screens/cart_screen.dart';
import 'features/invit/screens/category_deals_screen.dart';
import 'features/invit/screens/invite_screen.dart';
import 'features/paiement/screens/paiement_screen.dart';
import 'features/search/screens/search_invite.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case PayScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PayScreen(
          totalAmount: totalAmount,
        ),
      );
    case Orderss.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Orderss(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case InviteScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InviteScreen(),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CartScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case CategoryDealsScreenInv.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreenInv(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case SearchInvScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchInvScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case ProductDetailScreenInv.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreenInv(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
