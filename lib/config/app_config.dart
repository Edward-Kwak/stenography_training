import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

enum Flavor { dev, live, prod }

class AppConfig {
  final Flavor flavor;
  final bool isLive;
  final String baseUrl;
  final String basePrivacyUrl;
  final String baseContentUrl;
  final bool isProduction;

  AppConfig.dev()
      : flavor = Flavor.dev,
        isLive = false,
        baseUrl = '',
        basePrivacyUrl = '',
        baseContentUrl = '',
        isProduction = false;

  AppConfig.live({required this.isProduction})
      : flavor = Flavor.live,
        isLive = true,
        baseUrl = '',
        basePrivacyUrl = '',
        baseContentUrl = '';
}

AppConfig appConfig = AppConfig.live(isProduction: true);

// late Size screenSize;

Future<void> initializedApp({
  Flavor flavor = Flavor.prod,
}) async {
  if (flavor == Flavor.dev) {
    appConfig = AppConfig.dev();
  } else if (flavor == Flavor.live) {
    appConfig = AppConfig.live(isProduction: false);
  } else if (flavor == Flavor.prod) {
    appConfig = AppConfig.live(isProduction: true);
  }

  await findSystemLocale();
  Intl.defaultLocale = 'ko_KR';
}
