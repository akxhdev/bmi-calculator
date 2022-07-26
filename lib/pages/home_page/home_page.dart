import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/pages/home_page/home_page_provider.dart';
import 'package:bmi_calculator/validators/height_validator.dart';
import 'package:bmi_calculator/validators/weight_validator.dart';
import 'package:bmi_calculator/widgets/avatar_image.dart';
import 'package:bmi_calculator/widgets/field_label.dart';
import 'package:bmi_calculator/widgets/form_field.dart';
import 'package:bmi_calculator/widgets/info_button.dart';
import 'package:bmi_calculator/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          MyApp.appTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: const [InfoButton()],
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    AvatarImage(
                      imagePath: "assets/images/boy_emoji.png",
                      name: "Male",
                      gender: Gender.male,
                    ),
                    AvatarImage(
                      imagePath: "assets/images/girl_emoji.png",
                      name: "Female",
                      gender: Gender.female,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FieldLabel(label: "Your Weight (kg)"),
                    FieldLabel(label: "Your Height (cm)"),
                  ],
                ),
                Form(
                  key: provider.formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFormField(
                        autoFocus: true,
                        controller: provider.heightFieldTextController,
                        hintText: "80",
                        focusNode: provider.weightFieldFocusNode,
                        nextFocusNode: provider.heightFieldFocusNode,
                        validator: HeightValidator.validate,
                        onChanged: (value) => provider.onChangeFormField(
                            FormFields.weight, value),
                      ),
                      CustomFormField(
                        controller: provider.weightFieldTextController,
                        hintText: "175",
                        focusNode: provider.heightFieldFocusNode,
                        validator: WeightValidator.validate,
                        onChanged: (value) => provider.onChangeFormField(
                            FormFields.height, value),
                      ),
                    ],
                  ),
                ),
                const Space(vertical: 24),
                if (!provider.isBMICalcualted)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        provider.onSubmit();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Calculate your BMI"),
                      ),
                    ),
                  ),
                const Space(vertical: 24),
                if (provider.isBMICalcualted)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Your BMI"),
                      Text(
                        provider.BMI,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        provider.bmiCategory,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                const Space(vertical: 24),
                if (provider.isBMICalcualted)
                  TextButton.icon(
                    onPressed: provider.resetForm,
                    icon: const Icon(Icons.replay_outlined),
                    label: const Text("Calculate BMI again"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
