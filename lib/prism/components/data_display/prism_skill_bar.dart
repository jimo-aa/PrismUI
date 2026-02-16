import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

class PrismSkillBar extends StatelessWidget {
  final String label;
  final double value;
  final Color? color;
  final double height;

  const PrismSkillBar({
    super.key,
    required this.label,
    required this.value,
    this.color,
    this.height = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    final barColor = color ?? PrismColors.getBrandDefault(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: PrismColors.getTextSecondary(context),
              ),
            ),
            Text(
              "${(value * 100).toInt()}%",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PrismColors.getTextMain(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: PrismColors.getBgBody(context),
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
