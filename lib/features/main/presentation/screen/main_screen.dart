import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stenography_training/features/main/presentation/controller/main_screen_size_controller.dart';
import 'package:stenography_training/features/main/presentation/controller/main_side_bar_controller.dart';
import 'package:stenography_training/features/main/presentation/controller/main_timer_controller.dart';
import 'package:stenography_training/resources/resources.dart';
import 'package:stenography_training/utils/size/get_widget_offset.dart';
import 'package:stenography_training/widgets/dropdown/focus_dropdown_button.dart';
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
  double textInputFieldWidth = 800;
  double textInputFieldHeight = 600;

  @override
  void initState() {
    super.initState();

    focus.addListener(() {
      if (prevFocus != focus.hasFocus) {
        setState(() => prevFocus = focus.hasFocus);
      }
    });

    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    focus.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ref.watch(mainScreenSizeProvider);
    final isExpanded = ref.watch(mainSideBarProvider);

    if (screenSize.width < 1280) {
      textInputFieldWidth = isExpanded ? 410 : 410 + 200;
    }

    if (screenSize.width < 768) {
      Future.microtask(() {
        ref.read(mainSideBarProvider.notifier).state = false;
      });
      textInputFieldWidth = 200 * scaleWidth(context, screenSize.width);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (1280 <= screenSize.width) ...[
                        _contentTitle(constraints),
                        const HSpace(16),
                        SizedBox(
                          width: textInputFieldWidth,
                          height: 26 + textInputFieldHeight,
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabelText('내용'),
                                  HSpace(8),
                                ],
                              ),
                              const HSpace(8),
                              _textInputField(),
                            ],
                          ),
                        )
                      ] else if (768 <= screenSize.width) ...[
                        _contentTitle(constraints),
                        const HSpace(16),
                        SizedBox(
                          width: textInputFieldWidth,
                          height: 26 + textInputFieldHeight,
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabelText('내용'),
                                  HSpace(8),
                                ],
                              ),
                              const HSpace(8),
                              _textInputField(),
                            ],
                          ),
                        )
                      ] else ...[
                        Container(
                          width: constraints.maxWidth,
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '속기 연습',
                                style: AppStyles.body2XLB.copyWith(
                                  color: AppColors.dark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const HSpace(16),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Icon(
                            Icons.format_size_outlined,
                            color: AppColors.greyPrimaryText,
                          ),
                        ),
                        const HSpace(8),
                        FocusDropdownButton<double>(
                          width: 100,
                          height: 30,
                          initialValue: 12,
                          items: const [12, 14, 16, 18, 20, 32, 48],
                          toValue: (value) => '$value',
                          onChanged: (value) {
                            if (fontSize == value) {
                              return;
                            }
                            setState(() => fontSize = value);
                          },
                        ),
                        const HSpace(16),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3),
                          child: Icon(
                            Icons.timer_outlined,
                            color: AppColors.greyPrimaryText,
                          ),
                        ),
                        const HSpace(8),
                        Consumer(
                          builder: (context, ref, child) {
                            final timerCount = ref.watch(mainTimerProvider);

                            final h = timerCount ~/ 3600;

                            final m = ((timerCount - h * 3600)) ~/ 60;

                            final s = timerCount - (h * 3600) - (m * 60);

                            final hourLeft =
                                h.toString().length < 2 ? '0$h' : h.toString();

                            final minuteLeft =
                                m.toString().length < 2 ? '0$m' : m.toString();

                            final secondsLeft =
                                s.toString().length < 2 ? '0$s' : s.toString();

                            final result = "$hourLeft:$minuteLeft:$secondsLeft";

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
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
                        ),
                        const HSpace(16),
                        SizedBox(
                          width: textInputFieldWidth,
                          height: 26 + textInputFieldHeight,
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabelText('내용'),
                                  HSpace(8),
                                ],
                              ),
                              const HSpace(8),
                              _textInputField(),
                            ],
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  SizedBox _textInputField() {
    return SizedBox(
      height: textInputFieldHeight,
      child: TextField(
        focusNode: focus,
        maxLines: null,
        expands: true,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        controller: textEditingController,
        style: AppStyles.bodyMB.copyWith(
          color:
              focus.hasFocus ? AppColors.primary100 : AppColors.greyPrimaryText,
          fontSize: fontSize,
        ),
        cursorColor: AppColors.primary100,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.all(12),
            counterText: '',
            hintText: '내용을 입력해주세요.',
            hintStyle: AppStyles.bodyMR.copyWith(
              color: AppColors.greySecondaryText,
              fontSize: fontSize,
            )),
        onChanged: (value) {
          Future.microtask(() {
            if (value.isEmpty) {
              ref.read(mainTimerProvider.notifier).resetTimer();
            } else {
              ref.read(mainTimerProvider.notifier).startTimer();
            }
          });
        },
      ),
    );
  }

  Container _contentTitle(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth - 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.only(top: 16),
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
          const Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.format_size_outlined,
              color: AppColors.greyPrimaryText,
            ),
          ),
          const WSpace(8),
          FocusDropdownButton<double>(
            width: 100,
            height: 30,
            initialValue: 12,
            items: const [12, 14, 16, 18, 20, 32, 48],
            toValue: (value) => '$value',
            onChanged: (value) {
              if (fontSize == value) {
                return;
              }
              setState(() => fontSize = value);
            },
          ),
          const WSpace(16),
          const Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              Icons.timer_outlined,
              color: AppColors.greyPrimaryText,
            ),
          ),
          const WSpace(8),
          Consumer(
            builder: (context, ref, child) {
              final timerCount = ref.watch(mainTimerProvider);

              final h = timerCount ~/ 3600;

              final m = ((timerCount - h * 3600)) ~/ 60;

              final s = timerCount - (h * 3600) - (m * 60);

              final hourLeft = h.toString().length < 2 ? '0$h' : h.toString();

              final minuteLeft = m.toString().length < 2 ? '0$m' : m.toString();

              final secondsLeft =
                  s.toString().length < 2 ? '0$s' : s.toString();

              final result = "$hourLeft:$minuteLeft:$secondsLeft";

              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
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
    );
  }
}
