import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismTooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const PrismTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: PrismTypography.getBodySmall(context).copyWith(color: PrismColors.getBgBody(context)),
      decoration: BoxDecoration(
        color: PrismColors.getTextMain(context),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: child,
    );
  }
}
