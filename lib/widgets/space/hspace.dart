import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  const HSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
