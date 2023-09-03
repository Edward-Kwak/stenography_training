import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stenography_training/const/app_const.dart';

final mainTimerProvider = StateNotifierProvider<MainTimerState, int>(
  (ref) {
    final mainTimerState = MainTimerState();

    return mainTimerState;
  },
  name: 'mainTimerProvider',
);

class MainTimerState extends StateNotifier<int> {
  MainTimerState() : super(0);

  StreamSubscription<int>? streamSubscription;
  bool _running = false;

  void startTimer() {
    if (!_running) {
      _running = true;
      streamSubscription = Stream<int>.periodic(
        const Duration(seconds: 1),
        (x) => x + 1,
      ).take(maxTimerCountSecond).listen((event) => state = event);
    }
  }

  void stopTimer() {
    streamSubscription?.cancel();
  }

  void resetTimer() {
    streamSubscription?.cancel();
    state = 0;
    _running = false;
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    _running = false;
    super.dispose();
  }
}
