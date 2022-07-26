import 'package:flutter/material.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
