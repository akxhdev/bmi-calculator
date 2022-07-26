import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  double _BMI = 0.0;
  bool _isBMICalculated = false;
  Gender _selectedGeneder = Gender.male;

  final _weightFieldFocusNode = FocusNode();
  final _heightFieldFocusNode = FocusNode();

  final _weightFieldTextController = TextEditingController();
  final _heightFieldTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _formData = {
    FormFields.weight: "",
    FormFields.height: "",
  };

  String get BMI => _BMI.toStringAsFixed(2);

  bool get isBMICalcualted => _isBMICalculated;

  Gender get selectedGender => _selectedGeneder;

  void changeGender(Gender gender) {
    _selectedGeneder = gender;
    notifyListeners();
  }

  FocusNode get weightFieldFocusNode => _weightFieldFocusNode;
  FocusNode get heightFieldFocusNode => _heightFieldFocusNode;

  TextEditingController get weightFieldTextController =>
      _weightFieldTextController;
  TextEditingController get heightFieldTextController =>
      _heightFieldTextController;

  GlobalKey<FormState> get formKey => _formKey;

  void onChangeFormField(FormFields field, String value) {
    _formData[field] = value;
    notifyListeners();
  }

  String getFormFieldValue(FormFields field) {
    return _formData[field] ?? "";
  }

  void onSubmit() {
    var isValid = _validateForm();

    if (!isValid) return;

    // calculate BMI
    double weightInKg = double.parse(_formData[FormFields.weight] ?? "0");
    double heightInM = double.parse(_formData[FormFields.height] ?? "0") / 100;

    _BMI = _calculateBMI(weightInKg, heightInM);

    _isBMICalculated = true;

    notifyListeners();
  }

  double _calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  String get bmiCategory {
    if (!_isBMICalculated) return "";

    if (_BMI < 18.5) return "You're underweight";

    if (_BMI >= 18.5 && _BMI <= 24.9) return "You're normal";

    if (_BMI >= 25 && _BMI <= 29.9) return "You're overweight";

    return "Obedity";
  }

  bool _validateForm() {
    var currentState = _formKey.currentState;

    if (currentState == null) return false;

    return currentState.validate();
  }

  void resetForm() {
    _formData[FormFields.weight] = "";
    _formData[FormFields.height] = "";

    _BMI = 0.0;
    _isBMICalculated = false;

    _weightFieldTextController.clear();
    _heightFieldTextController.clear();

    notifyListeners();
  }
}

enum Gender { male, female }

enum FormFields { weight, height }
