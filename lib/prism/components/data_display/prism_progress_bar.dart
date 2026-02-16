import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

class PrismProgressBar extends StatelessWidget {
  final double value;
  final double height;
  final Color? color;
  final Color? backgroundColor;
  final String? label;
  final String? valueLabel;
  final bool showLabel;

  const PrismProgressBar({
    super.key,
    required this.value,
    this.height = 8.0,
    this.color,
    this.backgroundColor,
    this.label,
    this.valueLabel,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel && (label != null || valueLabel != null)) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: PrismColors.getTextMain(context),
                  ),
                ),
              if (valueLabel != null)
                Text(
                  valueLabel!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: PrismColors.getBrandDefault(context),
                  ),
                ),
            ],
          ),
          const SizedBox(height: PrismSpacings.sm),
        ],
        Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? PrismColors.getBgBody(context),
            borderRadius: BorderRadius.circular(PrismRadius.round),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: value.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: color ?? PrismColors.getBrandDefault(context),
                    borderRadius: BorderRadius.circular(PrismRadius.round),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
