import 'dart:ui';

import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismUpload extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData icon;
  final double height;
  final String? description;

  const PrismUpload({
    super.key,
    this.label = '点击上传或拖拽文件到此处',
    this.onTap,
    this.icon = Icons.cloud_upload_outlined,
    this.height = 120,
    this.description = '支持 SVG, PNG, JPG 或 GIF (最大 800x400px)',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DottedBorderPainter(
          color: PrismColors.getBorder(context),
          strokeWidth: 1,
          dashPattern: [6, 3],
          radius: 8,
        ),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: PrismColors.getBgBody(context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: PrismColors.getBgCard(context),
                  shape: BoxShape.circle,
                  border: Border.all(color: PrismColors.getBorder(context)),
                ),
                child: Icon(icon, color: PrismColors.getTextSecondary(context)),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: PrismTypography.getBodyMedium(context).copyWith(
                  color: PrismColors.getBrandDefault(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (description != null) ...[
                const SizedBox(height: 4),
                Text(
                  description!,
                  style: PrismTypography.getBodySmall(context).copyWith(
                    color: PrismColors.getTextSecondary(context),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;
  final double radius;

  _DottedBorderPainter({
    required this.color,
    this.strokeWidth = 1,
    this.dashPattern = const [6, 3],
    this.radius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

    final Path dashedPath = _dashPath(path, dashArray: CircularIntervalList(dashPattern));
    canvas.drawPath(dashedPath, paint);
  }

  Path _dashPath(Path source, {required CircularIntervalList<double> dashArray}) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = dashArray.next;
        if (draw) {
          dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
        }
        distance += len;
        draw = !draw;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(_DottedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius;
  }
}

class CircularIntervalList<T> {
  final List<T> _vals;
  int _idx = 0;

  CircularIntervalList(this._vals);

  T get next {
    if (_idx >= _vals.length) {
      _idx = 0;
    }
    return _vals[_idx++];
  }
}
