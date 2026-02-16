import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismContextMenuItem {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final bool isDestructive;

  PrismContextMenuItem({
    required this.label,
    required this.onTap,
    this.icon,
    this.isDestructive = false,
  });
}

class PrismContextMenu extends StatelessWidget {
  final Widget child;
  final List<PrismContextMenuItem> items;

  const PrismContextMenu({
    super.key,
    required this.child,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return GestureDetector(
          onSecondaryTapDown: (details) {
            controller.open(position: details.localPosition);
          },
          child: this.child,
        );
      },
      menuChildren: items.map((item) {
        return MenuItemButton(
          onPressed: item.onTap,
          child: Row(
            children: [
              if (item.icon != null) ...[
                Icon(
                  item.icon,
                  size: 16,
                  color: item.isDestructive
                      ? PrismColors.getError(context)
                      : PrismColors.getTextMuted(context),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                item.label,
                style: PrismTypography.getBodyMedium(context).copyWith(
                  color: item.isDestructive
                      ? PrismColors.getError(context)
                      : PrismColors.getTextMain(context),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.all(PrismColors.getBgCard(context)),
        surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8)),
        maximumSize: MaterialStateProperty.all(const Size(200, 300)),
      ),
    );
  }
}
