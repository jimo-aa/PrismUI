import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

class PrismLoading extends StatelessWidget {
  final double size;
  final Color? color;
  final double strokeWidth;

  const PrismLoading({
    super.key,
    this.size = 24,
    this.color,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? PrismColors.getBrandDefault(context),
          ),
        ),
      ),
    );
  }
}
