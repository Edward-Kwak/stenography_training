import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainSideBarProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
  name: 'mainSideBarProvider',
);
