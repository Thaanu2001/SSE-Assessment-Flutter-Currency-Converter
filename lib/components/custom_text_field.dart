import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/theme_constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.margins,
    this.controller,
    this.labelWidget,
    this.borderRadius,
    this.textInputFormatter,
    this.isNumber = false,
    this.errorText,
    this.onChanged,
    this.isDisabled,
    this.initialValue,
    this.borderColor,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.shadowDisable = false,
    this.contentPadding,
    this.focusNode,
    this.height,
    this.isDense,
    this.suffixIconConstraints,
    this.textCapitalization,
    this.labelStyle,
    this.hintStyle,
    this.textInputAction,
    this.onTap,
    this.onFieldSubmitted,
    this.autofillHints,
    this.style,
    this.validator,
    this.prefixIconConstraints,
  });

  ///The prefix icon of the text field
  final Widget? prefixIcon;

  ///The suffix icon of the text field
  final Widget? suffixIcon;

  ///The label text of the text field
  final String? labelText;

  ///The margins around the text field
  final EdgeInsets? margins;

  ///THe fint text of the text field
  final String? hintText;

  ///The label widget of the text field
  final Widget? labelWidget;

  final BorderRadius? borderRadius;

  final TextInputFormatter? textInputFormatter;

  final TextEditingController? controller;

  final String? errorText;

  final bool? isNumber;

  final bool? isDisabled;

  final Color? borderColor;

  final TextInputType? keyboardType;

//This will be the inital value of the text field
  final String? initialValue;

  final bool obscureText;

  final int? minLines;

  final int? maxLines;

  final bool shadowDisable;

  final EdgeInsetsGeometry? contentPadding;

  final FocusNode? focusNode;

  final double? height;

  final bool? isDense;

  final BoxConstraints? suffixIconConstraints;

  final TextCapitalization? textCapitalization;

  final Function(String)? onChanged;

  final TextStyle? labelStyle;

  final TextStyle? hintStyle;

  final TextStyle? style;

  final TextInputAction? textInputAction;

  final Function()? onTap;

  final Function(String)? onFieldSubmitted;

  final Iterable<String>? autofillHints;

  final String? Function(String?)? validator;

  final BoxConstraints? prefixIconConstraints;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: widget.margins,
      child: TextFormField(
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        enabled: widget.isDisabled == true ? false : true,
        controller: widget.controller,
        inputFormatters: widget.textInputFormatter != null
            ? [widget.textInputFormatter!]
            : [],
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: widget.style ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
        minLines: widget.minLines ?? 1,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: widget.hintText,
          labelText: widget.labelText,
          contentPadding: widget.contentPadding,
          isDense: widget.isDense,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: widget.suffixIconConstraints ??
              const BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
          prefixIconConstraints: widget.prefixIconConstraints ??
              const BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
          label: widget.labelWidget,
          labelStyle: widget.labelStyle,
          hintStyle: widget.hintStyle,
          errorText: widget.errorText,
        ),
        keyboardType: widget.keyboardType ?? TextInputType.text,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        autofillHints: widget.autofillHints,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
