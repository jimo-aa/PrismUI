import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

enum PrismInputSize { small, medium, large }
enum PrismInputStatus { neutral, error, success, warning }

class PrismTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String? successText;
  final PrismInputSize size;
  final PrismInputStatus status;
  final double? width;
  final int? maxLines;
  final bool enabled;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  const PrismTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.successText,
    this.size = PrismInputSize.medium,
    this.status = PrismInputStatus.neutral,
    this.width,
    this.maxLines = 1,
    this.enabled = true,
    this.onSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: PrismColors.getTextMain(context),
              ),
            ),
            const SizedBox(height: 6),
          ],
          SizedBox(
            height: maxLines == 1 ? _getHeight() : null,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              enabled: enabled,
              maxLines: maxLines,
              style: TextStyle(fontSize: _getFontSize(), color: PrismColors.getTextMain(context)),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: PrismColors.getTextSecondary(context)),
                prefixIcon: prefixIcon != null 
                  ? Icon(prefixIcon, size: _getIconSize(), color: PrismColors.getTextSecondary(context)) 
                  : null,
                suffixIcon: suffix,
                contentPadding: _getPadding(),
                border: _getBorder(context),
                enabledBorder: _getBorder(context),
                focusedBorder: _getFocusedBorder(context),
                errorBorder: _getErrorBorder(context),
                focusedErrorBorder: _getErrorBorder(context),
                fillColor: enabled ? PrismColors.getBgBody(context) : PrismColors.getBgBody(context).withOpacity(0.5),
                filled: true,
              ),
            ),
          ),
          if (errorText != null) ...[
             const SizedBox(height: 4),
             Text(
               errorText!,
               style: TextStyle(
                 fontSize: 12,
                 color: PrismColors.getError(context),
               ),
             ),
          ] else if (successText != null && status == PrismInputStatus.success) ...[
             const SizedBox(height: 4),
             Text(
               successText!,
               style: TextStyle(
                 fontSize: 12,
                 color: PrismColors.getSuccess(context),
               ),
             ),
          ]
        ],
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case PrismInputSize.small:
        return 32;
      case PrismInputSize.medium:
        return 40;
      case PrismInputSize.large:
        return 48;
    }
  }

  double _getFontSize() {
    switch (size) {
      case PrismInputSize.small:
      case PrismInputSize.medium:
        return 14;
      case PrismInputSize.large:
        return 16;
    }
  }

  double _getIconSize() {
    switch (size) {
      case PrismInputSize.small:
        return 14;
      case PrismInputSize.medium:
        return 16;
      case PrismInputSize.large:
        return 20;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    if (maxLines != 1) {
      switch (size) {
        case PrismInputSize.small:
          return const EdgeInsets.all(10);
        case PrismInputSize.medium:
          return const EdgeInsets.all(12);
        case PrismInputSize.large:
          return const EdgeInsets.all(16);
      }
    }

    switch (size) {
      case PrismInputSize.small:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 0);
      case PrismInputSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 0);
      case PrismInputSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 0);
    }
  }

  OutlineInputBorder _getBorder(BuildContext context) {
    Color borderColor = PrismColors.getBorder(context);
    if (status == PrismInputStatus.success) borderColor = PrismColors.getSuccess(context);
    if (status == PrismInputStatus.warning) borderColor = PrismColors.getWarning(context);
    if (status == PrismInputStatus.error || errorText != null) borderColor = PrismColors.getError(context);

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(PrismRadius.md),
      borderSide: BorderSide(color: borderColor),
    );
  }

  OutlineInputBorder _getFocusedBorder(BuildContext context) {
    Color borderColor = PrismColors.getBrandDefault(context);
    if (status == PrismInputStatus.success) borderColor = PrismColors.getSuccess(context);
    if (status == PrismInputStatus.warning) borderColor = PrismColors.getWarning(context);
    if (status == PrismInputStatus.error || errorText != null) borderColor = PrismColors.getError(context);

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(PrismRadius.md),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }

  OutlineInputBorder _getErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(PrismRadius.md),
      borderSide: BorderSide(color: PrismColors.getError(context)),
    );
  }
}
