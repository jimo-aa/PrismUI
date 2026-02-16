import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismDropdownItem<T> {
  final T value;
  final String label;
  final IconData? icon;

  PrismDropdownItem({
    required this.value,
    required this.label,
    this.icon,
  });
}

class PrismDropdown<T> extends StatelessWidget {
  final Widget? child;
  final Widget Function(BuildContext context, MenuController controller)? builder;
  final List<PrismDropdownItem<T>> items;
  final ValueChanged<T> onSelected;

  const PrismDropdown({
    super.key,
    this.child,
    this.builder,
    required this.items,
    required this.onSelected,
  }) : assert(child != null || builder != null, 'Either child or builder must be provided');

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, _) {
        if (builder != null) {
          return builder!(context, controller);
        }

        return GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: child!,
        );
      },
      menuChildren: items.map((item) {
        return MenuItemButton(
          onPressed: () => onSelected(item.value),
          child: Row(
            children: [
              if (item.icon != null) ...[
                Icon(item.icon, size: 18, color: PrismColors.getTextSecondary(context)),
                const SizedBox(width: 12),
              ],
              Text(
                item.label,
                style: PrismTypography.getBodyMedium(context).copyWith(
                  color: PrismColors.getTextMain(context),
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
      child: child,
    );
  }
}
