import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stenography_training/const/app_const.dart';
import 'package:stenography_training/resources/resources.dart';
import 'package:stenography_training/router/app_router.dart';
import 'package:stenography_training/widgets/space/hspace.dart';
import 'package:stenography_training/widgets/space/wspace.dart';

class LnbMenuButton extends StatelessWidget {
  const LnbMenuButton({
    super.key,
    required this.menuRoute,
    required this.subRoutes,
    required this.onIcon,
    required this.offIcon,
    this.isContainMain = false,
  });

  final Widget onIcon;
  final Widget offIcon;
  final AppRouterState menuRoute;
  final List<AppRouterState> subRoutes;
  final bool isContainMain;

  @override
  Widget build(BuildContext context) {
    final goRoute = GoRouter.of(context);

    bool isChecked = goRoute.location.contains(menuRoute.path);

    if (isContainMain) {
      isChecked = goRoute.location.contains(AppRouterState.main.path);
    }

    return AnimatedContainer(
      duration: animationDuration,
      width: 250,
      height: isChecked ? 40 + 18 + subRoutes.length * 36 : 40,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Consumer(
            builder: (context, ref, child) {
              return InkWell(
                onTap: () async {
                  goRoute.goNamed(menuRoute.name);
                },
                child: Container(
                  width: 210,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: isChecked
                      ? const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.primary20,
                        )
                      : null,
                  color: isChecked ? null : AppColors.white,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      isChecked ? onIcon : offIcon,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Text(
                          menuRoute.menuName,
                          style: AppStyles.bodyLB.copyWith(
                            color: isChecked
                                ? AppColors.primary100
                                : AppColors.greyPrimaryText,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            // child: ,
          ),
          if (isChecked) ...[
            const HSpace(18),
            ...List.generate(
              subRoutes.length,
              (index) => InkWell(
                onTap: () => goRoute.goNamed(subRoutes[index].name),
                child: SizedBox(
                  height: 36,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 30, bottom: 16),
                    children: [
                      const CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColors.primary100,
                      ),
                      const WSpace(12),
                      Text(
                        subRoutes[index].menuName,
                        style: goRoute.location.contains(subRoutes[index].path)
                            ? AppStyles.bodyLB
                                .copyWith(color: AppColors.primary100)
                            : AppStyles.bodyLR,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
