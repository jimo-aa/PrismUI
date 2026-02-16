import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';
import '../interactive/prism_hover.dart';

class PrismCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool hoverEffect;
  final bool isSelected;

  const PrismCard({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.width,
    this.height,
    this.onTap,
    this.hoverEffect = true,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return PrismHover(
      builder: (context, isHovered) {
        final showShadow = (hoverEffect && isHovered) || isSelected;
        final scale = isSelected ? 1.02 : (hoverEffect && isHovered ? 1.01 : 1.0);

        Widget card = AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width,
          height: height,
          transform: Matrix4.diagonal3Values(scale, scale, 1.0),
          transformAlignment: Alignment.center,
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor ?? PrismColors.getBgCard(context),
            borderRadius: BorderRadius.circular(PrismRadius.md),
            border: Border.all(
              color: isSelected 
                  ? PrismColors.getBrandDefault(context) 
                  : (hoverEffect && isHovered ? PrismColors.getBrandDefault(context).withOpacity(0.5) : PrismColors.getBorder(context)),
              width: 1.0,
            ),
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: isSelected 
                          ? PrismColors.getBrandDefault(context).withOpacity(0.15) 
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: child,
        );

        if (onTap != null) {
          return InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(PrismRadius.md),
            child: card,
          );
        }

        return card;
      },
    );
  }
}
