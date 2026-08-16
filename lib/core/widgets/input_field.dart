import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/styles/app_colors.dart';
import '../styles/app_text_styles.dart';

/// Custom Input Field --------------------------------------------------------- ///
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Function()? onTap;

  final String hint;
  final String? title;
  final String? errorText;

  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final Color? borderColor;
  final double? radius;

  final int? maxLines;
  final TextInputType? type;
  final TextCapitalization? capitalization;
  final String? initialValue;
  final FocusNode? focusNode;
  final VoidCallback? onEditing;
  final EdgeInsets? contentPadding;
  final bool isLight;
  final bool readOnly;

  final bool isPassword;


  const InputField({
    super.key,
    required this.controller,
    required this.hint,
    this.title,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.borderColor,
    this.radius,
    this.validator,
    this.type,
    this.maxLines = 1,
    this.errorText,
    this.onChanged,
    this.onTap,
    this.capitalization,
    this.initialValue,
    this.focusNode,
    this.onEditing,
    this.isLight = false,
    this.readOnly = false,
    this.contentPadding,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = radius ?? 4;

    return TextFormField(
      controller: controller,
      textCapitalization: capitalization ?? TextCapitalization.none,
      initialValue: initialValue,
      validator: validator,
      cursorColor: AppColors.text,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      focusNode: focusNode,
      onEditingComplete: onEditing,
      keyboardType: type,
      maxLines: maxLines,
      obscureText: isPassword ? true : false,


      style: AppTextStyles.body,
      decoration: InputDecoration(
        // padding
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 22, vertical: 15),

        // fill style
        fillColor: fillColor ?? AppColors.foreground,
        filled: true,

        // borders
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(width: 1, color: borderColor??Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(width: 1, color: borderColor??Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(width: 1, color: borderColor??Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),

        // Icons
        prefixIcon: prefix,
        suffixIcon: suffix,

        // Text & TextStyle
        hintText: hint,
        hintStyle: AppTextStyles.captionSmall.copyWith(color: AppColors.unFocused),
        errorText: errorText,
        errorStyle: AppTextStyles.captionSmall.copyWith(color: Colors.red),
        labelText: title,
        labelStyle: AppTextStyles.labelMedium,
      ),
    );
  }
}

/// Password Field ------------------------------------------------------------- ///
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PasswordField({
    required this.controller,
    this.validator,
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return InputField(
      hint: 'Type your password',
      controller: widget.controller,
      validator: widget.validator,
      isPassword: _obscure,
      suffix: IconButton(
        padding: const EdgeInsets.all(15),
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: SvgPicture.asset(
          width: 24,
          _obscure
              ? "assets/icons/password_visibility_off.svg"
              : "assets/icons/password_visibility_on.svg",
          color: _obscure ? AppColors.unFocused : AppColors.focused,
        ),
      ),
    );
  }
}