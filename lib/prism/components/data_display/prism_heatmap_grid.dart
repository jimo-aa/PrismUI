import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../layout/prism_card.dart';

class PrismHeatmapGrid extends StatelessWidget {
  final List<String> rows;
  final List<String> columns;
  final List<List<PrismHeatmapStatus>> data;

  const PrismHeatmapGrid({
    super.key,
    required this.rows,
    required this.columns,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLegendItem(context, PrismHeatmapStatus.idle, "空闲"),
            const SizedBox(width: 12),
            _buildLegendItem(context, PrismHeatmapStatus.normal, "适中"),
            const SizedBox(width: 12),
            _buildLegendItem(context, PrismHeatmapStatus.busy, "过载"),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            const SizedBox(width: 100),
            ...columns.map((col) => Expanded(
              child: Center(
                child: Text(
                  col,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: PrismColors.getTextMain(context),
                  ),
                ),
              ),
            )),
          ],
        ),
        const SizedBox(height: 12),

        ...rows.asMap().entries.map((entry) {
          final rowIndex = entry.key;
          final rowLabel = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: PrismColors.getBgCard(context),
                        child: Icon(Icons.person, size: 12, color: PrismColors.getTextSecondary(context)),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          rowLabel,
                          style: TextStyle(
                            fontSize: 14,
                            color: PrismColors.getTextMain(context),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(columns.length, (colIndex) {
                  final status = (rowIndex < data.length && colIndex < data[rowIndex].length)
                      ? data[rowIndex][colIndex]
                      : PrismHeatmapStatus.none;

                  return Expanded(
                    child: Container(
                      height: 32,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: _getColorForStatus(context, status),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildLegendItem(BuildContext context, PrismHeatmapStatus status, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: _getColorForStatus(context, status),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: PrismColors.getTextSecondary(context)),
        ),
      ],
    );
  }

  Color _getColorForStatus(BuildContext context, PrismHeatmapStatus status) {
    switch (status) {
      case PrismHeatmapStatus.idle:
        return const Color(0xFF86EFAC);
      case PrismHeatmapStatus.normal:
        return const Color(0xFF60A5FA);
      case PrismHeatmapStatus.busy:
        return const Color(0xFFF87171);
      case PrismHeatmapStatus.none:
      return PrismColors.getBgBody(context);
    }
  }
}

enum PrismHeatmapStatus { none, idle, normal, busy }
