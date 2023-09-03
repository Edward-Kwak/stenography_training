part of 'resources.dart';

abstract class AppStyles {
  static const title = TextStyle(
    fontSize: AppFontSize.title,
    color: AppColors.dark,
    fontWeight: AppFontWeight.bold,
    height: 40.0 / AppFontSize.title,
    letterSpacing: -0.5,
  );

  static const body2XLB = TextStyle(
    fontSize: AppFontSize.body2XL,
    color: AppColors.greyPrimaryText,
    fontWeight: AppFontWeight.bold,
    letterSpacing: -0.5,
  );

  static const bodyXLB = TextStyle(
    fontSize: AppFontSize.bodyXL,
    color: AppColors.greyPrimaryText,
    fontWeight: AppFontWeight.bold,
    letterSpacing: -0.5,
  );

  static const bodyXLR = TextStyle(
    fontSize: AppFontSize.bodyXL,
    color: AppColors.greyPrimaryText,
    fontWeight: AppFontWeight.regular,
    letterSpacing: -0.5,
  );

  static const bodyLB = TextStyle(
    fontSize: AppFontSize.bodyL,
    fontWeight: AppFontWeight.bold,
    color: AppColors.greyPrimaryText,
    height: 20.0 / AppFontSize.bodyL,
    letterSpacing: -0.5,
  );

  static const bodyLR = TextStyle(
    fontSize: AppFontSize.bodyL,
    fontWeight: AppFontWeight.regular,
    color: AppColors.greyPrimaryText,
    height: 20.0 / AppFontSize.bodyL,
    letterSpacing: -0.5,
  );

  static const bodyMB = TextStyle(
    fontSize: AppFontSize.bodyM,
    fontWeight: AppFontWeight.bold,
    color: AppColors.greyPrimaryText,
    height: 17.5 / AppFontSize.bodyM,
    letterSpacing: -0.5,
  );

  static const bodyMR = TextStyle(
    fontSize: AppFontSize.bodyM,
    fontWeight: AppFontWeight.regular,
    color: AppColors.greyPrimaryText,
    height: 17.5 / AppFontSize.bodyM,
    letterSpacing: -0.5,
  );

  static const bodySR = TextStyle(
    fontSize: AppFontSize.bodyS,
    fontWeight: AppFontWeight.regular,
    color: AppColors.greyPrimaryText,
    height: 15.0 / AppFontSize.bodyS,
    letterSpacing: -0.5,
  );

  static const bodySB = TextStyle(
    fontSize: AppFontSize.bodyS,
    fontWeight: AppFontWeight.bold,
    color: AppColors.greyPrimaryText,
    height: 15.0 / AppFontSize.bodyS,
    letterSpacing: -0.5,
  );
}
