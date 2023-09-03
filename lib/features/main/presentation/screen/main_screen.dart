import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stenography_training/features/main/presentation/controller/main_screen_size_controller.dart';
import 'package:stenography_training/features/main/presentation/controller/main_timer_controller.dart';
import 'package:stenography_training/resources/resources.dart';
import 'package:stenography_training/widgets/dropdown/focus_dropdown_button.dart';
import 'package:stenography_training/widgets/input_field/common_text_field.dart';
import 'package:stenography_training/widgets/space/hspace.dart';
import 'package:stenography_training/widgets/space/wspace.dart';
import 'package:stenography_training/widgets/text/label_text.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late final TextEditingController textEditingController;
  final focus = FocusNode();
  bool prevFocus = false;
  double fontSize = 12;
  late Timer _timer;
  int _time = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();

    focus.addListener(() {
      if (prevFocus != focus.hasFocus) {
        setState(() => prevFocus = focus.hasFocus);
      }
    });

    _startTimer();
    _pauseTimer();

    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      Future.microtask(() {
        if (textEditingController.text.isEmpty) {
          _resetTimer();
        } else {
          if (!_isRunning) {
            _startTimer();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    focus.dispose();
    textEditingController.dispose();
    _timer.cancel();
    super.dispose();
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
        _isRunning = true;
      });
    });
  }

  _pauseTimer() {
    _timer.cancel();
  }

  _resetTimer() {
    setState(() {
      _isRunning = false;
      _timer.cancel();
      _time = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ref.watch(mainScreenSizeProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        print('========== constraints ==========');
        print(constraints.maxWidth);
        print(constraints.maxHeight);

        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (1280 <= screenSize.width) ...[
                      Container(
                        width: constraints.maxWidth - 70,
                        height: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '속기 연습',
                              style: AppStyles.body2XLB.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                            const WSpace(80),
                            const Icon(
                              Icons.format_size_outlined,
                              color: AppColors.greyPrimaryText,
                            ),
                            FocusDropdownButton<double>(
                              width: 140,
                              height: 38,
                              initialValue: 12,
                              items: const [12, 14, 16, 18, 20, 32, 48],
                              toValue: (value) => '$value',
                              onChanged: (value) {
                                if (fontSize == value) {
                                  return;
                                }

                                fontSize = value;
                              },
                            ),
                            const Icon(
                              Icons.timer_outlined,
                              color: AppColors.greyPrimaryText,
                            ),
                            const WSpace(8),
                            Consumer(
                              builder: (context, ref, child) {
                                // final timerCount = ref.watch(mainTimerProvider);
                                final timerCount = _time;

                                final h = timerCount ~/ 3600;

                                final m = ((timerCount - h * 3600)) ~/ 60;

                                final s = timerCount - (h * 3600) - (m * 60);

                                final hourLeft = h.toString().length < 2
                                    ? '0$h'
                                    : h.toString();

                                final minuteLeft = m.toString().length < 2
                                    ? '0$m'
                                    : m.toString();

                                final secondsLeft = s.toString().length < 2
                                    ? '0$s'
                                    : s.toString();

                                final result =
                                    "$hourLeft:$minuteLeft:$secondsLeft";

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    result,
                                    style: AppStyles.bodyMR.copyWith(
                                      color: timerCount <= 600
                                          ? AppColors.wrong
                                          : AppColors.greySecondaryText,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      const HSpace(16),
                      SizedBox(
                        width: 1052,
                        height: 176,
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LabelText('내용'),
                                HSpace(8),
                              ],
                            ),
                            const HSpace(8),
                            SizedBox(
                              height: 150,
                              child: TextField(
                                focusNode: focus,
                                controller: textEditingController,
                                style: AppStyles.bodyMB.copyWith(
                                  color: focus.hasFocus
                                      ? AppColors.primary100
                                      : AppColors.greyPrimaryText,
                                  fontSize: fontSize,
                                ),
                                cursorColor: AppColors.primary100,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.white,
                                  contentPadding: EdgeInsets.all(12),
                                  counterText: '',
                                  hintText: '내용을 입력해주세요.',
                                ),
                                onChanged: (value) {
                                  // Future.microtask(() {
                                  //   if (value.isEmpty) {
                                  //     _resetTimer();
                                  //   } else {
                                  //     if (!_isRunning) {
                                  //       _startTimer();
                                  //     }
                                  //   }
                                  // });

                                  // Future.microtask(() {
                                  //   if (value.isEmpty) {
                                  //     ref
                                  //         .read(mainTimerProvider.notifier)
                                  //         .resetTimer();
                                  //   } else {
                                  //     ref
                                  //         .read(mainTimerProvider.notifier)
                                  //         .startTimer();
                                  //   }
                                  // });
                                },
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        ),
                      )
                    ] else if (768 <= screenSize.width) ...[
                      SizedBox(
                        width: constraints.maxWidth,
                        height: 80,
                        child: Row(
                          children: [
                            Text('타이머 태블릿'),
                          ],
                        ),
                      ),
                    ] else ...[
                      SizedBox(
                        width: constraints.maxWidth,
                        height: 80,
                        child: Row(
                          children: [
                            Text('타이머 모바일'),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
