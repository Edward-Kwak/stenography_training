part of 'resources.dart';

abstract class AppThemes {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: FontFamily.notoSansKR,
    shadowColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      hintStyle: AppStyles.bodyMR.copyWith(
        color: AppColors.greySecondaryText,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.greyBorder,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.primary100,
        ),
      ),
    ),
  );
}
