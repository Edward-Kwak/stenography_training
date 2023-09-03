import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainScreenSizeProvider = StateProvider.autoDispose<Size>(
  (ref) => Size(0, 0),
  name: 'mainScreenSizeProvider',
);
