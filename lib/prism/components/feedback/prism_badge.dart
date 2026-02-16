import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

enum PrismBadgeVariant { primary, success, warning, error, info, neutral }

class PrismBadge extends StatelessWidget {
  final String text;
  final PrismBadgeVariant variant;
  final bool rounded;

  const PrismBadge({
    super.key,
    required this.text,
    this.variant = PrismBadgeVariant.primary,
    this.rounded = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(rounded ? 100 : 4),
        border: Border.all(color: _getBorderColor()),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: _getTextColor(context),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (variant) {
      case PrismBadgeVariant.primary:
        return PrismColors.getBrandDefault(context).withOpacity(0.1);
      case PrismBadgeVariant.success:
        return PrismColors.getSuccess(context).withOpacity(0.1);
      case PrismBadgeVariant.warning:
        return PrismColors.getWarning(context).withOpacity(0.1);
      case PrismBadgeVariant.error:
        return PrismColors.getError(context).withOpacity(0.1);
      case PrismBadgeVariant.info:
        return PrismColors.getInfo(context).withOpacity(0.1);
      case PrismBadgeVariant.neutral:
        return PrismColors.getBgBody(context);
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (variant) {
      case PrismBadgeVariant.primary:
        return PrismColors.getBrandDefault(context);
      case PrismBadgeVariant.success:
        return PrismColors.getSuccess(context);
      case PrismBadgeVariant.warning:
        return PrismColors.getWarning(context);
      case PrismBadgeVariant.error:
        return PrismColors.getError(context);
      case PrismBadgeVariant.info:
        return PrismColors.getInfo(context);
      case PrismBadgeVariant.neutral:
        return PrismColors.getTextSecondary(context);
    }
  }
  
  Color _getBorderColor() {
    return Colors.transparent;
  }
}
