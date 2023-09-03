import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stenography_training/resources/resources.dart';

enum AppButtonStyleType {
  primarySolid,
  secondarySolid,
  greyLine,
  primaryLine,
  radio,
  table,
  greyIcon,
}

class AppButton extends StatefulWidget {
  const AppButton.primarySolid({
    super.key,
    required this.onPressed,
    required this.height,
    required this.width,
    this.title,
    this.child,
    this.buttonStyle = AppButtonStyleType.primarySolid,
  }) : assert(title != null || child != null);

  const AppButton.secondarySolid({
    super.key,
    required this.height,
    required this.width,
    this.title,
    this.child,
    required this.onPressed,
    this.buttonStyle = AppButtonStyleType.secondarySolid,
  }) : assert(title != null || child != null);

  const AppButton.greyLine({
    super.key,
    required this.height,
    required this.width,
    this.title,
    this.child,
    required this.onPressed,
    this.buttonStyle = AppButtonStyleType.greyLine,
  }) : assert(title != null || child != null);

  const AppButton.primaryLine({
    super.key,
    required this.height,
    required this.width,
    this.title,
    this.child,
    required this.onPressed,
    this.buttonStyle = AppButtonStyleType.primaryLine,
  }) : assert(title != null || child != null);

  const AppButton.radio({
    super.key,
    required this.height,
    required this.width,
    this.title,
    this.child,
    required this.onPressed,
    this.buttonStyle = AppButtonStyleType.radio,
  }) : assert(title != null || child != null);

  const AppButton.table({
    super.key,
    required this.height,
    required this.width,
    this.title,
    this.child,
    required this.onPressed,
    this.buttonStyle = AppButtonStyleType.table,
  }) : assert(title != null || child != null);

  const AppButton.grayIcon({
    super.key,
    required this.height,
    required this.width,
    this.title,
    this.child,
    required this.onPressed,
    this.buttonStyle = AppButtonStyleType.greyIcon,
  }) : assert(title != null || child != null);

  final void Function()? onPressed;
  final AppButtonStyleType buttonStyle;
  final double height;
  final double width;
  final String? title;
  final Widget? child;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isFocused = false;
  bool isHovered = false;

  late final ButtonStyle? style;

  @override
  void initState() {
    super.initState();
    switch (widget.buttonStyle) {
      case AppButtonStyleType.primarySolid:
        style = AppButtonStyle.primarySolid.style;
        break;

      case AppButtonStyleType.secondarySolid:
        style = AppButtonStyle.secondarySolid.style;
        break;

      case AppButtonStyleType.greyLine:
        style = AppButtonStyle.greyLine.style;
        break;

      case AppButtonStyleType.primaryLine:
        style = AppButtonStyle.primaryLine.style;
        break;

      case AppButtonStyleType.radio:
        style = AppButtonStyle.radio.style;
        break;

      case AppButtonStyleType.table:
        style = AppButtonStyle.table.style;
        break;

      case AppButtonStyleType.greyIcon:
        style = AppButtonStyle.greyIcon.style;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    late BoxDecoration decoration;
    Widget? childWidget;
    final isEnabled = widget.onPressed != null;
    switch (widget.buttonStyle) {
      case AppButtonStyleType.primarySolid:
        decoration = AppButtonStyle.primarySolidDecoration(
          isEnabled: isEnabled,
          isFocused: isFocused,
          isHovered: isHovered,
        );

        break;

      case AppButtonStyleType.secondarySolid:
        decoration = AppButtonStyle.secondarySolidDecoration(
          isEnabled: isEnabled,
          isFocused: isFocused,
          isHovered: isHovered,
        );

        break;

      case AppButtonStyleType.greyLine:
        decoration = AppButtonStyle.greyLineDecoration(
          isEnabled: isEnabled,
          isFocused: isFocused,
          isHovered: isHovered,
        );

        break;

      case AppButtonStyleType.primaryLine:
        decoration = AppButtonStyle.primaryLineDecoration(
          isEnabled: isEnabled,
          isFocused: isFocused,
          isHovered: isHovered,
        );

        break;

      case AppButtonStyleType.radio:
        decoration = AppButtonStyle.radioDecoration(
          isEnabled: isEnabled,
          isFocused: isFocused,
          isHovered: isHovered,
        );

        break;

      case AppButtonStyleType.table:
        decoration = AppButtonStyle.tableDecoration(
            isEnabled: isEnabled, isFocused: isFocused, isHovered: isHovered);

        break;

      case AppButtonStyleType.greyIcon:
        decoration = AppButtonStyle.greyIconDecoration(
            isEnabled: isEnabled, isFocused: isFocused, isHovered: isHovered);

        final foregroundColor = style?.foregroundColor;
        final Set<MaterialState> materialStates = {};
        if (!isEnabled) {
          materialStates.add(MaterialState.disabled);
        }
        if (isHovered) {
          materialStates.add(MaterialState.hovered);
        }
        if (isFocused) {
          materialStates.add(MaterialState.focused);
        }
        final resolve = foregroundColor?.resolve(materialStates);
        final child = widget.child;
        if (child != null && child is SvgPicture && resolve != null) {
          childWidget = ColorFiltered(
            colorFilter: ColorFilter.mode(resolve, BlendMode.srcIn),
            child: widget.child,
          );
        }

        break;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      decoration: decoration,
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: widget.onPressed,
          onFocusChange: (value) => setState(() => isFocused = value),
          onHover: (value) {
            setState(() => isHovered = value);
          },
          style: style,
          child: childWidget ?? widget.child ?? Text(widget.title!),
        ),
      ),
    );
  }
}
