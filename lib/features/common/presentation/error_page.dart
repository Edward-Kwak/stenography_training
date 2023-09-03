import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_training/assets/assets.gen.dart';
import 'package:stenography_training/resources/app_button.dart';
import 'package:stenography_training/resources/resources.dart';
import 'package:stenography_training/router/app_router.dart';
import 'package:stenography_training/utils/web/web_util.dart';
import 'package:stenography_training/widgets/space/hspace.dart';
import 'package:stenography_training/widgets/space/wspace.dart';

enum ErrorPageType {
  notFound(
    '죄송합니다. 찾을 수 없는 페이지입니다.',
    '존재하지 않는 주소를 입력하셨거나, 요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.',
    [ErrorPageButtonType.main, ErrorPageButtonType.prevPage],
  ),
  unAuthorized(
    '이 페이지에 접근할 수 있는 권한이 없습니다.',
    '',
    [ErrorPageButtonType.main],
  ),
  serverError(
    '서버 오류가 발생했습니다.',
    '잠시 후 다시 시도해주세요.',
    [ErrorPageButtonType.refresh, ErrorPageButtonType.prevPage],
  ),
  networkError(
    '네트워크 장애가 발생했습니다.',
    '죄송합니다. 네트워크 연결 상태가 좋지 않습니다.\n잠시 후 다시 시도해주세요. ',
    [ErrorPageButtonType.refresh, ErrorPageButtonType.prevPage],
  );

  final String title;
  final String message;
  final List<ErrorPageButtonType> buttonTypes;

  const ErrorPageType(this.title, this.message, this.buttonTypes);
}

enum ErrorPageButtonType {
  main('메인으로'),
  refresh('새로고침'),
  prevPage('이전 페이지');

  final String title;

  const ErrorPageButtonType(this.title);
}

class ErrorPage extends StatelessWidget {
  final ErrorPageType pageType;
  final bool isAppRunning;

  const ErrorPage({Key? key, required this.pageType, this.isAppRunning = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonTypes = List<ErrorPageButtonType>.from(pageType.buttonTypes);
    if (!isAppRunning) {
      buttonTypes.remove(ErrorPageButtonType.prevPage);
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageType.asset.image(width: 640),
            const HSpace(68),
            Text(
              pageType.title,
              style: AppStyles.title,
            ),
            const HSpace(18),
            Text(
              pageType.message,
              style: AppStyles.bodyLR,
              textAlign: TextAlign.center,
            ),
            const HSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (buttonTypes.isNotEmpty)
                  AppButton.primarySolid(
                      title: buttonTypes[0].title,
                      onPressed: buttonTypes[0].onPressed(context),
                      height: 38,
                      width: 100),
                if (buttonTypes.length >= 2) ...[
                  const WSpace(20),
                  AppButton.secondarySolid(
                    title: buttonTypes[1].title,
                    onPressed: buttonTypes[1].onPressed(context),
                    height: 38,
                    width: 100,
                  )
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}

extension ErrorPageMainAsset on ErrorPageType {
  get asset {
    switch (this) {
      case ErrorPageType.notFound:
        return Assets.image.notFound;
      case ErrorPageType.unAuthorized:
        return Assets.image.unauthorized;
      case ErrorPageType.serverError:
      case ErrorPageType.networkError:
        return Assets.image.serverError;
    }
  }
}

extension ErrorPageButtonAction on ErrorPageButtonType {
  onPressed(BuildContext context) {
    switch (this) {
      case ErrorPageButtonType.main:
        return () => context.goNamed(AppRouterState.main.name);

      case ErrorPageButtonType.refresh:
        return () => WebUtil.reload();

      case ErrorPageButtonType.prevPage:
        return () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.goNamed(AppRouterState.main.name);
          }
        };
    }
  }
}
