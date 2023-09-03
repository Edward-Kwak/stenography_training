import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stenography_training/const/app_const.dart';

final mainTimerProvider = StateNotifierProvider<MainTimerState, int>(
  (ref) {
    final mainTimerState = MainTimerState();

    // mainTimerState.resetTimer();

    return mainTimerState;
  },
  name: 'mainTimerProvider',
);

class MainTimerState extends StateNotifier<int> {
  MainTimerState() : super(0);

  StreamSubscription<int>? streamSubscription;
  // late Timer timer;
  // bool isRunning = false;
  // int seconds = 0;

  void startTimer() {
    // isRunning = true;
    // timer = Timer.periodic(
    //   const Duration(seconds: 1),
    //   (timer) {
    //     seconds++;
    //   },
    // );

    /// origin
    streamSubscription = Stream<int>.periodic(
      const Duration(seconds: 1),
      (x) => x + 1,
    ).take(maxTimerCountSecond).listen((event) => state = event);
  }

  void stopTimer() {
    print('======== stop timer =========');
    streamSubscription?.cancel();

    // isRunning = false;
    // timer.cancel();
  }

  void resetTimer() {
    print('======== reset timer =========');

    /// origin
    streamSubscription?.cancel();
    state = 0;
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
