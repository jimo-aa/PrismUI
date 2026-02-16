import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';
import '../buttons/prism_button.dart';

class PrismPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final bool showFirstLast;

  const PrismPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.showFirstLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFirstLast) ...[
          IconButton(
            onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
            icon: const Icon(Icons.first_page),
            color: PrismColors.getTextMain(context),
            disabledColor: PrismColors.getTextSecondary(context).withOpacity(0.5),
            splashRadius: 20,
          ),
          const SizedBox(width: 4),
        ],
        // 上一页
        IconButton(
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          icon: const Icon(Icons.chevron_left),
          color: PrismColors.getTextMain(context),
          disabledColor: PrismColors.getTextSecondary(context).withOpacity(0.5),
          tooltip: '上一页',
        ),
        const SizedBox(width: 8),
        _buildPageNumbers(context),
        const SizedBox(width: 8),
        IconButton(
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
          icon: const Icon(Icons.chevron_right),
          color: PrismColors.getTextMain(context),
          disabledColor: PrismColors.getTextSecondary(context).withOpacity(0.5),
          splashRadius: 20,
        ),
        if (showFirstLast) ...[
          const SizedBox(width: 4),
          IconButton(
            onPressed: currentPage < totalPages ? () => onPageChanged(totalPages) : null,
            icon: const Icon(Icons.last_page),
            color: PrismColors.getTextMain(context),
            disabledColor: PrismColors.getTextSecondary(context).withOpacity(0.5),
            splashRadius: 20,
          ),
        ],
      ],
    );
  }

  Widget _buildPageNumbers(BuildContext context) {
    List<Widget> pages = [];
    
    for (int i = 1; i <= totalPages; i++) {
      if (i == 1 || i == totalPages || (i >= currentPage - 1 && i <= currentPage + 1)) {
        pages.add(_buildPageButton(context, i));
      } else if (i == currentPage - 2 || i == currentPage + 2) {
        pages.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '...',
              style: PrismTypography.getBodyMedium(context).copyWith(color: PrismColors.getTextSecondary(context)),
            ),
          ),
        );
      }
    }

    return Row(children: pages);
  }

  Widget _buildPageButton(BuildContext context, int page) {
    final bool isCurrent = page == currentPage;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 32,
      height: 32,
      child: TextButton(
        onPressed: () => onPageChanged(page),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: isCurrent ? PrismColors.getBrandDefault(context) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isCurrent ? BorderSide.none : BorderSide(color: PrismColors.getBorder(context)),
          ),
        ),
        child: Text(
          page.toString(),
          style: PrismTypography.getBodySmall(context).copyWith(
            color: isCurrent ? Colors.white : PrismColors.getTextMain(context),
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
