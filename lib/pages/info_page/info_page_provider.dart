import 'package:flutter/cupertino.dart';

class InfoPageProvider with ChangeNotifier {
  List<BmiCategory> get bmiCategories => [
        BmiCategory(range: "Less than 18.5", message: "You're underweight"),
        BmiCategory(range: "18.5 to 24.9", message: "You're normal"),
        BmiCategory(range: "25 to 29.9", message: "You're overweight"),
        BmiCategory(range: "30 or more", message: "Obesity"),
      ];
}

class BmiCategory {
  final String range;
  final String message;

  BmiCategory({
    required this.range,
    required this.message,
  });
}
