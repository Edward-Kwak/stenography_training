import 'package:flutter/material.dart';
import 'package:stenography_training/utils/size/get_widget_offset.dart';

bool isOpenedUpside(
  BuildContext context,
  GlobalKey key,
) {
  final offset = getWidgetOffset(key);
  final height = MediaQuery.of(context).size.height;

  if (height / 2 <= offset.dy) {
    return true;
  }

  return false;
}
