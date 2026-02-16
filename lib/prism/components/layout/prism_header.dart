import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

class PrismHeader extends StatelessWidget {
  final Widget? title;
  final Widget? searchBar;
  final List<Widget>? actions;
  final double height;
  final bool borderBottom;

  const PrismHeader({
    super.key,
    this.title,
    this.searchBar,
    this.actions,
    this.height = 64,
    this.borderBottom = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: PrismColors.getBgCard(context),
        border: borderBottom
            ? Border(bottom: BorderSide(color: PrismColors.getBorder(context)))
            : null,
      ),
      child: Row(
        children: [
          if (title != null) title!,
          if (searchBar != null) ...[
            const SizedBox(width: 48),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: searchBar,
                ),
              ),
            ),
          ] else
            const Spacer(),
          if (actions != null) ...[
            const SizedBox(width: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!.map((action) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: action,
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
