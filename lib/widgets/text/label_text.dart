import 'package:flutter/material.dart';
import 'package:stenography_training/resources/resources.dart';

class LabelText extends StatelessWidget {
  const LabelText(this.label, {Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppStyles.bodyMB,
    );
  }
}
