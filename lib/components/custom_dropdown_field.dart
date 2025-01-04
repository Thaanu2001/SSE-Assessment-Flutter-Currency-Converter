import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    this.value,
    this.items,
    this.prefixIcon,
    this.labelText,
    this.hintText,
    this.margins,
    this.labelWidget,
    this.borderRadius,
    this.errorText,
    this.onChanged,
    this.isDisabled,
    this.suffixIcon,
    this.shadowDisable = false,
    this.contentPadding,
    this.focusNode,
    this.height,
    this.isDense,
    this.suffixIconConstraints,
    this.labelStyle,
    this.hintStyle,
    this.onTap,
    this.style,
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

  final String? errorText;

  final bool? isDisabled;

  final bool shadowDisable;

  final EdgeInsetsGeometry? contentPadding;

  final FocusNode? focusNode;

  final double? height;

  final bool? isDense;

  final BoxConstraints? suffixIconConstraints;

  final Function(T?)? onChanged;

  final TextStyle? labelStyle;

  final TextStyle? hintStyle;

  final TextStyle? style;

  final Function()? onTap;

  final T? value;

  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margins,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<T>(
          items: items,
          value: value,
          focusNode: focusNode,
          style: style ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xEE404040),
              ),
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            contentPadding: contentPadding,
            isDense: isDense,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints ??
                const BoxConstraints(
                  minWidth: 25,
                  minHeight: 25,
                ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 25,
              minHeight: 25,
            ),
            label: labelWidget,
            labelStyle: labelStyle,
            hintStyle: hintStyle,
            errorText: errorText,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          onTap: onTap,
        ),
      ),
    );
  }
}
