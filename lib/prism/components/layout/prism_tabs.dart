import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

class PrismTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const PrismTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: PrismColors.getBgBody(context),
        borderRadius: BorderRadius.circular(PrismRadius.md),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;
          return _PrismTabItem(
            label: tabs[index],
            isSelected: isSelected,
            onTap: () => onTabSelected(index),
          );
        }),
      ),
    );
  }
}

class _PrismTabItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PrismTabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_PrismTabItem> createState() => _PrismTabItemState();
}

class _PrismTabItemState extends State<_PrismTabItem> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: widget.isSelected 
            ? const Duration(milliseconds: 200) 
            : Duration.zero,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? PrismColors.getBgCard(context)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(PrismRadius.sm),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(PrismRadius.sm),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected
                      ? PrismColors.getTextMain(context)
                      : PrismColors.getTextSecondary(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
