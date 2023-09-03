part of 'app_router.dart';

enum AppRouterState {
  // login('login', 'login', '로그인'),
  main('', 'main', '속기연습'),
  error('error/:code', 'error-page', '오류페이지');

  final String path;
  final String name;
  final String menuName;

  const AppRouterState(
    this.path,
    this.name,
    this.menuName,
  );
}
