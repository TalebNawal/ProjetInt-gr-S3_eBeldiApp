import 'package:ebeldi/features/account/services/account_services.dart';
import 'package:ebeldi/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Déconnextion',
              onTap: () => AccountServices().logOut(context),
            ),
          ],
        ),
      ],
    );
  }
}
