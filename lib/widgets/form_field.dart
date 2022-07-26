import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.onChanged,
    required this.validator,
    this.autoFocus = false,
    this.nextFocusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final bool autoFocus;

  final String? Function(String?) validator;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.36,
      child: TextFormField(
        autofocus: autoFocus,
        controller: controller,
        autovalidateMode: AutovalidateMode.always,
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        onSaved: (_) {
          if (nextFocusNode == null) return;
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          errorMaxLines: 2,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
