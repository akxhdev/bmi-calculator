class HeightValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) return null;

    double height = double.tryParse(value) ?? 0.0;

    if (height <= 0.0) return "Height should be greater than 0cm";

    if (height > 250) return "Height should be less than 250cm";

    return null;
  }
}
