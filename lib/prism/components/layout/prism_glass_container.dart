import 'dart:ui';
import 'package:flutter/material.dart';

class PrismGlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final Color? color;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const PrismGlassContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.7,
    this.color,
    this.borderRadius,
    this.border,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);

    return ClipRRect(
      borderRadius: effectiveBorderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: (color ?? Colors.white).withOpacity(opacity),
            borderRadius: effectiveBorderRadius,
            border: border ?? Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: child,
        ),
      ),
    );
  }
}
