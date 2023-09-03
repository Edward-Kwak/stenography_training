import 'package:flutter/material.dart';

Offset getWidgetOffset(GlobalKey key) {
  final RenderBox? renderBox =
      key.currentContext?.findRenderObject() as RenderBox?;

  if (renderBox == null) {
    return Offset.zero;
  }

  return Offset(
    renderBox.localToGlobal(Offset.zero).dx,
    renderBox.localToGlobal(Offset.zero).dy,
  );
}

Size getWidgetSize(GlobalKey key) {
  final renderBox = key.currentContext?.findRenderObject() as RenderBox?;

  if (renderBox == null) {
    return Size.zero;
  }

  return renderBox.size;
}

double scaleWidth(BuildContext context, double deviceWidth) {
  const designGuideWidth = 360;
  final diff = deviceWidth / designGuideWidth;
  return diff;
}
