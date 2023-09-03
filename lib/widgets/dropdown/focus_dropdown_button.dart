import 'package:flutter/material.dart';
import 'package:stenography_training/resources/resources.dart';
import 'package:stenography_training/router/app_router.dart';
import 'package:stenography_training/utils/size/get_widget_offset.dart';
import 'package:stenography_training/widgets/dropdown/is_open_upside.dart';

part './focus_dropdown_list.dart';

class FocusDropdownButton<T> extends StatefulWidget {
  const FocusDropdownButton({
    super.key,
    this.width = 180,
    this.height = 40,
    required this.items,
    this.defaultValue = '전체',
    this.onChanged,
    this.toValue,
    this.initialValue,
    this.isDataGridDropdownButton = false,
    this.isNewData = false,
  });

  const FocusDropdownButton.dataGrid({
    super.key,
    this.width = 180,
    this.height = 40,
    required this.items,
    this.defaultValue = '선택',
    this.onChanged,
    this.toValue,
    this.initialValue,
    this.isDataGridDropdownButton = true,
    this.isNewData = false,
  });

  final double width;
  final double height;
  final String defaultValue;
  final List<T> items;
  final T? initialValue;
  final void Function(T value)? onChanged;
  final String Function(T value)? toValue;

  final bool isDataGridDropdownButton;
  final bool isNewData;

  @override
  State<FocusDropdownButton<T>> createState() => _FocusDropdownButtonState<T>();
}

class _FocusDropdownButtonState<T> extends State<FocusDropdownButton<T>> {
  final layerLink = LayerLink();
  final focusNode = FocusNode();

  bool prevFocus = false;
  bool isChangeFocus = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  late final String defaultValue = widget.defaultValue;
  late T? selectedValue = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    final customDropdownKey = GlobalKey();

    return CompositedTransformTarget(
      link: layerLink,
      child: SizedBox(
        width: widget.isDataGridDropdownButton ? null : widget.width,
        height: widget.height,
        child: ElevatedButton(
          key: customDropdownKey,
          focusNode: focusNode,
          onFocusChange: (hasFocus) => setState(() {
            if (isChangeFocus) {
              prevFocus = hasFocus;
            }
          }),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape: widget.isDataGridDropdownButton
                ? const RoundedRectangleBorder()
                : const RoundedRectangleBorder(
                    borderRadius: AppBorder.radius8,
                  ),
            elevation: 0,
            backgroundColor: widget.isDataGridDropdownButton
                ? Colors.transparent
                : AppColors.white,
            foregroundColor:
                prevFocus ? AppColors.primary100 : AppColors.greySecondaryText,
            side: widget.isDataGridDropdownButton
                ? BorderSide.none
                : BorderSide(
                    width: 1,
                    color: prevFocus
                        ? AppColors.primary100
                        : AppColors.greyBorder),
          ),
          onPressed: widget.onChanged == null
              ? null
              : () async {
                  isChangeFocus = false;
                  setState(() => prevFocus = true);

                  final result = await rootNavigatorKey.currentState?.push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (
                        context,
                        animation,
                        secondaryAnimation,
                      ) =>
                          FocusDropdownList<T>(
                        offset: getWidgetOffset(customDropdownKey),
                        width: widget.isDataGridDropdownButton
                            ? getWidgetSize(customDropdownKey).width
                            : widget.width,
                        isUpside: isOpenedUpside(context, customDropdownKey),
                        layerLink: layerLink,
                        items: widget.items,
                        selectedValue: selectedValue,
                        toValue: widget.toValue ?? (value) => value.toString(),
                        isDataGridItem: widget.isDataGridDropdownButton,
                      ),
                      transitionsBuilder: (
                        _,
                        animation,
                        secondaryAnimation,
                        child,
                      ) =>
                          FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  );

                  focusNode.requestFocus();
                  isChangeFocus = true;

                  if (result == null) {
                    return;
                  }

                  setState(() => selectedValue = result);
                  widget.onChanged!(result);
                },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  selectedValue != null
                      ? (widget.toValue != null
                          ? widget.toValue!(selectedValue as T)
                          : selectedValue.toString())
                      : defaultValue,
                  style: selectedValue != null
                      ? widget.isDataGridDropdownButton
                          ? AppStyles.bodyMR.copyWith(
                              color: prevFocus || widget.isNewData
                                  ? AppColors.primary100
                                  : null,
                            )
                          : AppStyles.bodyMB.copyWith(
                              color: prevFocus ? AppColors.primary100 : null,
                            )
                      : AppStyles.bodyMR.copyWith(
                          color: prevFocus ? AppColors.primary100 : null,
                        ),
                  textAlign:
                      widget.isDataGridDropdownButton ? TextAlign.center : null,
                ),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                color: prevFocus
                    ? AppColors.primary100
                    : AppColors.greyPrimaryText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
