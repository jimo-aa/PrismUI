import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';
import '../general/prism_pagination.dart';
import '../inputs/prism_checkbox.dart';

class PrismDataColumn {
  final String label;
  final bool numeric;
  final bool sortable;
  final double? width;

  const PrismDataColumn({
    required this.label,
    this.numeric = false,
    this.sortable = false,
    this.width,
  });
}

class PrismDataRow {
  final List<Widget> cells;
  final bool selected;
  final ValueChanged<bool?>? onSelectChanged;
  final VoidCallback? onTap;

  const PrismDataRow({
    required this.cells,
    this.selected = false,
    this.onSelectChanged,
    this.onTap,
  });
}

class PrismDataTable extends StatelessWidget {
  final List<PrismDataColumn> columns;
  final List<PrismDataRow> rows;
  final int? sortColumnIndex;
  final bool sortAscending;
  final ValueChanged<int>? onSort;
  final bool showCheckboxColumn;
  final bool allSelected;
  final ValueChanged<bool?>? onSelectAll;
  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;
  final Widget? emptyState;

  const PrismDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSort,
    this.showCheckboxColumn = false,
    this.allSelected = false,
    this.onSelectAll,
    this.currentPage = 1,
    this.totalPages = 1,
    this.onPageChanged,
    this.emptyState,
  });

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty && emptyState != null) {
      return emptyState!;
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: PrismColors.getBgCard(context),
            border: Border.all(color: PrismColors.getBorder(context)),
            borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            // 标题
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: PrismColors.getBorder(context))),
                ),
                child: Row(
                  children: [
                    if (showCheckboxColumn) ...[
                      PrismCheckbox(
                        value: allSelected,
                        onChanged: onSelectAll ?? (_) {},
                      ),
                      const SizedBox(width: 16),
                    ],
                    ...List.generate(columns.length, (index) {
                      final col = columns[index];
                      return Expanded(
                        flex: col.width != null ? 0 : 1,
                        child: SizedBox(
                          width: col.width,
                          child: InkWell(
                            onTap: col.sortable && onSort != null
                                ? () => onSort!(index)
                                : null,
                            child: Row(
                              mainAxisAlignment: col.numeric
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Text(
                                  col.label,
                                  style: PrismTypography.getBodySmall(context).copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: PrismColors.getTextSecondary(context),
                                  ),
                                ),
                                if (col.sortable && sortColumnIndex == index) ...[
                                  const SizedBox(width: 4),
                                  Icon(
                                    sortAscending
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    size: 14,
                                    color: PrismColors.getTextSecondary(context),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
                itemCount: rows.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: PrismColors.getBorder(context),
                ),
                itemBuilder: (context, index) {
                  final row = rows[index];
                  return InkWell(
                    onTap: row.onTap,
                    hoverColor: PrismColors.getBrandDefault(context).withOpacity(0.05),
                    child: Container(
                      color: row.selected
                          ? PrismColors.getBrandDefault(context).withOpacity(0.05)
                          : Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          if (showCheckboxColumn) ...[
                            PrismCheckbox(
                              value: row.selected,
                              onChanged: row.onSelectChanged ?? (_) {},
                            ),
                            const SizedBox(width: 16),
                          ],
                          ...List.generate(columns.length, (colIndex) {
                            final col = columns[colIndex];
                            final cell = row.cells[colIndex];
                            return Expanded(
                              flex: col.width != null ? 0 : 1,
                              child: SizedBox(
                                width: col.width,
                                child: Align(
                                  alignment: col.numeric
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: cell,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        if (totalPages > 1 && onPageChanged != null) ...[
          const SizedBox(height: 16),
          PrismPagination(
            currentPage: currentPage,
            totalPages: totalPages,
            onPageChanged: onPageChanged!,
            showFirstLast: true,
          ),
        ],
      ],
    );
  }
}
