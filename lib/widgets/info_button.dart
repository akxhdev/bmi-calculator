import 'package:bmi_calculator/pages/info_page/info_page.dart';
import 'package:bmi_calculator/pages/info_page/info_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ChangeNotifierProvider(
              create: (_) => InfoPageProvider(),
              child: const InfoPage(),
            );
          },
        );
      },
      icon: const Icon(Icons.info),
    );
  }
}
