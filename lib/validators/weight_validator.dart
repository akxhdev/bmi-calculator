class WeightValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    double weight = double.tryParse(value) ?? 0.0;

    if (weight <= 0.0) return "Weight should be greater than 0kg";

    if (weight > 250) return "Weight should be less than 250kg";

    return null;
  }
}
