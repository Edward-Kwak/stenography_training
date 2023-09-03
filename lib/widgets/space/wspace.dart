import 'package:flutter/material.dart';

class WSpace extends StatelessWidget {
  const WSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
