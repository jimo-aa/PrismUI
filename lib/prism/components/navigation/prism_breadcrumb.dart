import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismBreadcrumbItem {
  final String label;
  final VoidCallback? onTap;

  PrismBreadcrumbItem({required this.label, this.onTap});
}

class PrismBreadcrumb extends StatelessWidget {
  final List<PrismBreadcrumbItem> items;
  final Widget? separator;

  const PrismBreadcrumb({
    super.key,
    required this.items,
    this.separator,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final effectiveSeparator = separator ?? Icon(
      Icons.chevron_right,
      size: 16,
      color: PrismColors.getTextMuted(context),
    );

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final isLast = i == items.length - 1;

      children.add(
        InkWell(
          onTap: isLast ? null : item.onTap,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              item.label,
              style: isLast
                  ? PrismTypography.getBodySmall(context).copyWith(
                      color: PrismColors.getTextMain(context),
                      fontWeight: FontWeight.w500,
                    )
                  : PrismTypography.getBodySmall(context).copyWith(
                      color: PrismColors.getTextMuted(context),
                    ),
            ),
          ),
        ),
      );

      if (!isLast) {
        children.add(effectiveSeparator);
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
