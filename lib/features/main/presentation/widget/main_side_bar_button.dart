import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stenography_training/const/app_const.dart';
import 'package:stenography_training/features/main/presentation/controller/main_side_bar_controller.dart';
import 'package:stenography_training/router/app_router.dart';
import 'package:stenography_training/widgets/lnb/lnb_menu_button.dart';

class MainSideBarButton extends ConsumerWidget {
  const MainSideBarButton({
    Key? key,
    required this.menuRoute,
    required this.subRoutes,
    required this.onIcon,
    required this.offIcon,
    this.isContainMain = false,
  }) : super(key: key);

  final AppRouterState menuRoute;
  final List<AppRouterState> subRoutes;
  final Widget onIcon;
  final Widget offIcon;
  final bool isContainMain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(mainSideBarProvider);

    return AnimatedSwitcher(
      duration: animationDuration,
      child: isExpanded
          ? LnbMenuButton(
              onIcon: onIcon,
              offIcon: offIcon,
              menuRoute: menuRoute,
              subRoutes: subRoutes,
              isContainMain: isContainMain,
            )
          : const SizedBox.shrink(),
    );
  }
}
