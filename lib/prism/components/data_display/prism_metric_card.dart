import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../layout/prism_card.dart';

class PrismMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? trend;
  final bool isTrendUp;
  final IconData? icon;
  final VoidCallback? onTap;

  const PrismMetricCard({
    super.key,
    required this.label,
    required this.value,
    this.trend,
    this.isTrendUp = true,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PrismCard(
      onTap: onTap,
      hoverEffect: true,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: PrismColors.getTextSecondary(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: PrismColors.getBrandDefault(context).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 16, color: PrismColors.getBrandDefault(context)),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: PrismColors.getTextMain(context),
              height: 1.2,
            ),
          ),
          if (trend != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isTrendUp ? Icons.trending_up : Icons.trending_down,
                  size: 16,
                  color: isTrendUp ? PrismColors.getSuccess(context) : PrismColors.getError(context),
                ),
                const SizedBox(width: 4),
                Text(
                  trend!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isTrendUp ? PrismColors.getSuccess(context) : PrismColors.getError(context),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
