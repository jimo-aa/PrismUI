import 'package:flutter/material.dart';
import '../../theme/prism_constants.dart';
import '../layout/prism_card.dart';

class PrismGradientCard extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final Color? backgroundColor;
  final double height;
  final VoidCallback? onTap;

  const PrismGradientCard({
    super.key,
    required this.child,
    this.gradient,
    this.backgroundColor,
    this.height = 200,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PrismCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient ??
              const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          borderRadius: BorderRadius.circular(PrismRadius.md),
        ),
        child: child,
      ),
    );
  }
}
