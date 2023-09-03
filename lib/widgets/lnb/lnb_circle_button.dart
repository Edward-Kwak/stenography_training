import 'package:flutter/material.dart';
import 'package:stenography_training/const/app_const.dart';
import 'package:stenography_training/resources/resources.dart';

class LnbCircleButton extends StatelessWidget {
  const LnbCircleButton({
    super.key,
    required this.layerLink,
    required this.isExpanded,
    this.onPressed,
  });

  final LayerLink layerLink;
  final bool isExpanded;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformFollower(
      link: layerLink,
      targetAnchor: Alignment.centerRight,
      offset: const Offset(-20, 0),
      child: InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary100,
          foregroundColor: AppColors.white,
          child: AnimatedRotation(
            duration: animationDuration,
            turns: isExpanded ? 0 : 0.5,
            child: const Icon(
              Icons.chevron_left,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
