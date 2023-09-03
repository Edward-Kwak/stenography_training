import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stenography_training/resources/resources.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    Key? key,
    this.maxLength,
    this.hintText,
    this.maxLines,
    this.contentPadding,
    this.textAlign,
    this.inputFormatters,
    required this.textEditingController,
  }) : super(key: key);

  final int? maxLength;
  final String? hintText;
  final int? maxLines;
  final TextEditingController textEditingController;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final focus = FocusNode();
  bool prevFocus = false;

  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      if (prevFocus != focus.hasFocus) {
        setState(() => prevFocus = focus.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: widget.maxLength,
      focusNode: focus,
      controller: widget.textEditingController,
      style: AppStyles.bodyMB.copyWith(
        color:
            focus.hasFocus ? AppColors.primary100 : AppColors.greyPrimaryText,
      ),
      maxLines: widget.maxLines,
      cursorColor: AppColors.primary100,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: widget.contentPadding,
        counterText: '',
        hintText: widget.hintText,
      ),
      textAlign: widget.textAlign ?? TextAlign.start,
    );
  }
}
