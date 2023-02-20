import 'package:ebeldi/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 248, 236),
            Color.fromARGB(255, 255, 248, 236),
          ],
          // stops: [0.5, 1.0],
        ),
      ),
      // padding: const EdgeInsets.only(left: 0),
      child: Row(
        children: [
          const Icon(
            Icons.favorite_border,
            size: 20,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 10),
              child: Text("Suggestion pour vous",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          /*const Padding(
            padding: EdgeInsets.only(
              left: 5,
              top: 2,
            ),
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 30,
            ),
          )*/
        ],
      ),
    );
  }
}
