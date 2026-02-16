import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

class PrismSearchBar extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onSearch;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PrismSearchBar({
    super.key,
    this.hint = '全局搜索...',
    this.onSearch,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        onChanged: onSearch,
        onTap: onTap,
        style: TextStyle(fontSize: 14, color: PrismColors.getTextMain(context)),
        decoration: InputDecoration(
          filled: true,
          fillColor: PrismColors.getBgBody(context),
          hintText: hint,
          hintStyle: TextStyle(color: PrismColors.getTextSecondary(context)),
          prefixIcon: Icon(Icons.search, size: 18, color: PrismColors.getTextSecondary(context)),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildShortcutBadge(context, 'Ctrl'),
                const SizedBox(width: 4),
                _buildShortcutBadge(context, 'K'),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: PrismColors.getBorder(context)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: PrismColors.getBorder(context)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: PrismColors.getBrandDefault(context), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildShortcutBadge(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: PrismColors.getBorder(context),
        borderRadius: BorderRadius.circular(PrismRadius.sm),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: PrismColors.getTextSecondary(context),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
