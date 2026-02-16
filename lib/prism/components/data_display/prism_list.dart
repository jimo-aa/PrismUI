import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismListItem extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool selected;

  const PrismListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: selected ? PrismColors.getBrandDefault(context).withOpacity(0.1) : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: PrismTypography.getBodyMedium(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: PrismColors.getTextMain(context),
                    ),
                    child: title,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    DefaultTextStyle(
                      style: PrismTypography.getBodySmall(context).copyWith(
                        color: PrismColors.getTextSecondary(context),
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 16),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

class PrismListGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;

  const PrismListGroup({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      shape: const Border(),
      collapsedShape: const Border(),
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        title.toUpperCase(),
        style: PrismTypography.getBodySmall(context).copyWith(
          color: PrismColors.getTextSecondary(context),
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
      children: children,
    );
  }
}
