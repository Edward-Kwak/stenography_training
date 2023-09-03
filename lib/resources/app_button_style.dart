part of 'resources.dart';

abstract class AppButtonStyle {
  static final primarySolid = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMB),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primary120;
          } else if (states.contains(MaterialState.disabled)) {
            return AppColors.greyDisableButton;
          } else {
            return AppColors.primary100;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          }

          return AppColors.white;
        },
      ),
    ),
  );

  static BoxDecoration primarySolidDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.primary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.primary70,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );

  static final secondarySolid = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMB),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.secondary120;
          } else if (states.contains(MaterialState.disabled)) {
            return AppColors.greyDisableButton;
          } else {
            return AppColors.secondary100;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          }

          return AppColors.white;
        },
      ),
    ),
  );

  static BoxDecoration secondarySolidDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.secondary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.secondary70,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );

  static final greyLine = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMB),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: MaterialStateProperty.all(AppColors.white),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          } else if (states.contains(MaterialState.pressed)) {
            return AppColors.primary100;
          } else if (states.contains(MaterialState.hovered)) {
            return AppColors.primary100;
          } else if (states.contains(MaterialState.focused)) {
            return AppColors.primary100;
          } else {
            return AppColors.greyPrimaryText;
          }
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.disabled)) {
            return const BorderSide(
              color: AppColors.greySecondaryText,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.hovered)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.focused)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else {
            return const BorderSide(
              color: AppColors.greyBorder,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          }
        },
      ),
    ),
  );

  static BoxDecoration greyLineDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.primary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.primary70,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );

  static final primaryLine = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMB),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primary100;
          }
          return AppColors.white;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          } else if (states.contains(MaterialState.pressed)) {
            return AppColors.white;
          }

          return AppColors.primary100;
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide.none;
          } else if (states.contains(MaterialState.disabled)) {
            return const BorderSide(
              color: AppColors.greySecondaryText,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.hovered)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.focused)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          }
        },
      ),
    ),
  );

  static BoxDecoration primaryLineDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.primary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.primary70,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );

  static final radio = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMR),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.primary20;
          } else if (states.contains(MaterialState.disabled)) {
            return AppColors.greyDisableButton;
          } else {
            return AppColors.greyRadioButton;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          } else if (states.contains(MaterialState.pressed)) {
            return AppColors.primary100;
          }

          return AppColors.greyPrimaryText;
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.focused)) {
            return BorderSide.none;
          } else {
            return const BorderSide(
              color: AppColors.greyBorder,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          }
        },
      ),
    ),
  );

  static BoxDecoration radioDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.primary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.greySecondaryText,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );

  static final dropdown = ButtonStyle(
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.primary20;
        }
        return AppColors.white;
      },
    ),
    foregroundColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return AppColors.primary100;
        }
        return AppColors.greyPrimaryText;
      },
    ),
    textStyle: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.hovered)) {
          return AppStyles.bodyMB.copyWith(
            color: AppColors.primary100,
          );
        }
        return AppStyles.bodyMR;
      },
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );

  static final table = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMB),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greyDisableButton;
          } else {
            return AppColors.primary20;
          }
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          }
          return AppColors.primary100;
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (!states.contains(MaterialState.disabled)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else {
            return const BorderSide(
              color: AppColors.greyBorder,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          }
        },
      ),
    ),
  );

  static BoxDecoration tableDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.primary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.primary70,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );

  static final greyIcon = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(AppStyles.bodyMB),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greyDisableButton;
          } else {
            return AppColors.white;
          }
        },
      ),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.greySecondaryText;
          } else if (states.contains(MaterialState.pressed)) {
            return AppColors.primary100;
          } else if (states.contains(MaterialState.hovered)) {
            return AppColors.primary100;
          } else if (states.contains(MaterialState.focused)) {
            return AppColors.primary100;
          } else {
            return AppColors.greyPrimaryText;
          }
        },
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.disabled)) {
            return const BorderSide(
              color: AppColors.greySecondaryText,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.hovered)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else if (states.contains(MaterialState.focused)) {
            return const BorderSide(
              color: AppColors.primary100,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          } else {
            return const BorderSide(
              color: AppColors.greyBorder,
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
            );
          }
        },
      ),
    ),
  );

  static BoxDecoration greyIconDecoration({
    required bool isHovered,
    required bool isFocused,
    required bool isEnabled,
  }) =>
      BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          isFocused
              ? const BorderSide(
                  color: AppColors.primary40,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 4,
                )
              : BorderSide.none,
        ),
        boxShadow: !isEnabled
            ? null
            : isHovered
                ? [
                    const BoxShadow(
                      color: AppColors.primary70,
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
      );
}
