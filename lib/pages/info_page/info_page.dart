import 'package:bmi_calculator/pages/info_page/info_page_provider.dart';
import 'package:bmi_calculator/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoPageProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "BMI Categories",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => const Space(vertical: 8),
              itemBuilder: (context, index) {
                var bmiCategory = provider.bmiCategories[index];

                return ListTile(
                  title: Text(
                    bmiCategory.range,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    bmiCategory.message,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
              itemCount: provider.bmiCategories.length,
            ),
          ),
        );
      },
    );
  }
}
