part of 'resources.dart';

abstract class AppDecorations {
  static const defaultShadow = BoxShadow(
    color: Color.fromRGBO(110, 122, 163, 0.2),
    spreadRadius: 0,
    blurRadius: 8,
  );

  static const shadowRadius20 = BoxDecoration(
    color: AppColors.white,
    borderRadius: AppBorder.radius16,
    boxShadow: [defaultShadow],
  );

  static const borderGreyRadius10 = BoxDecoration(
    borderRadius: AppBorder.radius8,
    color: AppColors.white,
    border: AppBorder.grey,
  );
}

abstract class AppBorder {
  static const radius8 = BorderRadius.all(Radius.circular(8));

  static const radius16 = BorderRadius.all(Radius.circular(16));

  static const grey = Border.fromBorderSide(
    BorderSide(
      width: 1,
      color: AppColors.greyBorder,
    ),
  );

  static const primary = Border.fromBorderSide(
    BorderSide(
      width: 1,
      color: AppColors.primary100,
    ),
  );
}
