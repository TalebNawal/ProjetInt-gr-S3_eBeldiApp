import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/account/widgets/below_app_bar.dart';
import 'package:ebeldi/features/account/widgets/orders.dart';
import 'package:ebeldi/features/account/widgets/top_buttons.dart';
import 'package:ebeldi/features/admin/screens/orders_screen.dart';
import 'package:ebeldi/features/order/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../providers/user_provider.dart';
import '../widgets/account_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void navigateToOrders() {
    Navigator.pushNamed(
      context,
      Orderss.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 15),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Bonjour ',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        children: [
                          TextSpan(
                            text: user.name,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          //const BelowAppBar(),
          Row(
            children: [
              AccountButton(
                text: 'Commandes',
                onTap: () => {
                  navigateToOrders(),
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
