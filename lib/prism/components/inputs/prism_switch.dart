import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool disabled;
  final String? label;

  const PrismSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.disabled = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    Widget switchWidget = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: disabled ? null : () => onChanged?.call(!value),
        borderRadius: BorderRadius.circular(12),
        hoverColor: _getBackgroundColor(context).withOpacity(0.1),
        splashColor: _getBackgroundColor(context).withOpacity(0.2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 24,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: BorderRadius.circular(12),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          switchWidget,
          const SizedBox(width: 8),
          Text(
            label!,
            style: PrismTypography.getBodyMedium(context).copyWith(
              color: disabled
                  ? PrismColors.getTextSecondary(context)
                  : PrismColors.getTextMain(context),
            ),
          ),
        ],
      );
    }

    return switchWidget;
  }

  Color _getBackgroundColor(BuildContext context) {
    if (disabled) {
      return value 
          ? PrismColors.getBrandDefault(context).withOpacity(0.5) 
          : PrismColors.getBorder(context).withOpacity(0.5);
    }
    return value ? PrismColors.getBrandDefault(context) : PrismColors.getBorder(context);
  }
}
