import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

enum PrismTagVariant {
  primary,
  success,
  warning,
  error,
  info,
  neutral,
  purple,
  blue,
}

enum PrismTagSize { small, medium }

class PrismTag extends StatelessWidget {
  final String text;
  final PrismTagVariant variant;
  final PrismTagSize size;
  final IconData? icon;
  final VoidCallback? onDeleted;
  final bool rounded;

  const PrismTag({
    super.key,
    required this.text,
    this.variant = PrismTagVariant.primary,
    this.size = PrismTagSize.small,
    this.icon,
    this.onDeleted,
    this.rounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(rounded ? PrismRadius.round : 4),
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: _getIconSize(), color: _getTextColor(context)),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: _getFontSize(),
              fontWeight: FontWeight.w500,
              color: _getTextColor(context),
            ),
          ),
          if (onDeleted != null) ...[
            const SizedBox(width: 4),
            InkWell(
              onTap: onDeleted,
              child: Icon(Icons.close, size: _getIconSize(), color: _getTextColor(context)),
            ),
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (variant) {
      case PrismTagVariant.primary:
        return PrismColors.getBrandDefault(context).withOpacity(0.1);
      case PrismTagVariant.success:
        return PrismColors.getSuccess(context).withOpacity(0.1);
      case PrismTagVariant.warning:
        return PrismColors.getWarning(context).withOpacity(0.1);
      case PrismTagVariant.error:
        return PrismColors.getError(context).withOpacity(0.1);
      case PrismTagVariant.info:
        return PrismColors.getInfo(context).withOpacity(0.1);
      case PrismTagVariant.neutral:
        return PrismColors.getBgBody(context);
      case PrismTagVariant.purple:
        return PrismColors.getBrandDefault(context).withOpacity(0.15);
      case PrismTagVariant.blue:
        return PrismColors.getInfo(context).withOpacity(0.15);
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (variant) {
      case PrismTagVariant.primary:
        return PrismColors.getBrandDefault(context);
      case PrismTagVariant.success:
        return PrismColors.getSuccess(context);
      case PrismTagVariant.warning:
        return PrismColors.getWarning(context);
      case PrismTagVariant.error:
        return PrismColors.getError(context);
      case PrismTagVariant.info:
        return PrismColors.getInfo(context);
      case PrismTagVariant.neutral:
        return PrismColors.getTextSecondary(context);
      case PrismTagVariant.purple:
        return const Color(0xFF7E22CE);
      case PrismTagVariant.blue:
        return const Color(0xFF1D4ED8);
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case PrismTagSize.small:
        return const EdgeInsets.symmetric(horizontal: 6, vertical: 2);
      case PrismTagSize.medium:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    }
  }

  double _getFontSize() {
    return size == PrismTagSize.small ? 12 : 13;
  }

  double _getIconSize() {
    return size == PrismTagSize.small ? 12 : 14;
  }
}
