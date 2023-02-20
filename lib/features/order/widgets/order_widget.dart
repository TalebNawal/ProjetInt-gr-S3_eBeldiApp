import 'package:ebeldi/common/widgets/stars.dart';
import 'package:ebeldi/models/order.dart';
import 'package:ebeldi/models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  final String image;
  const OrderWidget({
    Key? key,
    required this.order,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 248, 236),
            border: Border.all(
              color: Color.fromARGB(255, 231, 231, 231),
            ),
          ),
          child: Row(
            children: [
              Image.network(
                image,
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Date : ${DateFormat().format(
                        DateTime.fromMillisecondsSinceEpoch(order.orderedAt),
                      )}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ), /*Text(
                      order.orderedAt,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),*/
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '${order.totalPrice} Dhs',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
