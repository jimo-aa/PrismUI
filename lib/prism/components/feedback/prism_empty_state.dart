import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../buttons/prism_button.dart';

class PrismEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final double? iconSize;
  final Color? iconColor;
  final IconData? actionIcon;

  const PrismEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
    this.iconSize = 64,
    this.iconColor,
    this.actionIcon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: PrismColors.getBgBody(context).withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: PrismColors.getBorder(context).withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor ?? PrismColors.getTextSecondary(context).withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: PrismColors.getTextMain(context),
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Text(
                  description!,
                  style: TextStyle(
                    fontSize: 14,
                    color: PrismColors.getTextSecondary(context),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 32),
              PrismButton(
                text: actionLabel!,
                onPressed: onAction,
                size: PrismButtonSize.medium,
                icon: actionIcon,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
