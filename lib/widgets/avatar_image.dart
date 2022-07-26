import 'package:bmi_calculator/pages/home_page/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.gender,
  }) : super(key: key);
  final String imagePath;
  final String name;
  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return Opacity(
          opacity: provider.selectedGender == gender ? 1 : 0.2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withAlpha(60),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.36 * 0.5),
                  onTap: () {
                    if (provider.selectedGender == gender) return;
                    provider.changeGender(gender);
                  },
                  child: Image.asset(
                    imagePath,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ),
              ),
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
