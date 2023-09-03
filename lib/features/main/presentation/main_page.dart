import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_training/const/app_const.dart';
import 'package:stenography_training/features/main/presentation/controller/main_screen_size_controller.dart';
import 'package:stenography_training/features/main/presentation/controller/main_side_bar_controller.dart';
import 'package:stenography_training/features/main/presentation/widget/main_side_bar_button.dart';
import 'package:stenography_training/resources/resources.dart';
import 'package:stenography_training/router/app_router.dart';
import 'package:stenography_training/widgets/space/hspace.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    final isExpanded = ref.watch(mainSideBarProvider);
    final goRoute = GoRouter.of(context);
    final screenSize = ref.watch(mainScreenSizeProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AnimatedPadding(
            duration: animationDuration,
            padding: EdgeInsets.only(left: isExpanded ? 250 : 60),
            child: widget.child,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: AnimatedContainer(
              duration: animationDuration,
              decoration: BoxDecoration(
                color: isExpanded ? AppColors.white : AppColors.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyBorder.withOpacity(0.25),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isExpanded ? 20 : 10,
                vertical: 20,
              ),
              width: isExpanded ? 250 : 60,
              height: screenSize.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(mainSideBarProvider.notifier).state =
                            !isExpanded;
                      },
                      child: const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.menu_outlined,
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                    const HSpace(48),
                    Center(
                      child: MainSideBarButton(
                        menuRoute: AppRouterState.main,
                        subRoutes: const [],
                        onIcon: const Icon(
                          Icons.text_snippet_outlined,
                          color: AppColors.primary100,
                        ),
                        offIcon: const Icon(
                          Icons.text_snippet_outlined,
                          color: AppColors.greyPrimaryText,
                        ),
                        isContainMain:
                            goRoute.location.contains(AppRouterState.main.path),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
