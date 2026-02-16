import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

enum PrismButtonVariant { primary, secondary, outline, ghost, danger, text }
enum PrismButtonSize { mini, small, medium, large }

class PrismButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final PrismButtonVariant variant;
  final PrismButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool disabled;
  final double? width;
  final double? height;
  final bool fullWidth;

  const PrismButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = PrismButtonVariant.primary,
    this.size = PrismButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.disabled = false,
    this.width,
    this.height,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveWidth = fullWidth ? double.infinity : width;
    
    return SizedBox(
      width: effectiveWidth,
      height: height ?? _getHeight(),
      child: ElevatedButton(
        onPressed: (disabled || isLoading) ? null : onPressed,
        style: _getStyle(context),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(_getTextColor(context)),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: _getIconSize()),
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }

  ButtonStyle _getStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: _getBackgroundColor(context),
      foregroundColor: _getTextColor(context),
      elevation: 0,
      shadowColor: Colors.transparent,
      side: _getBorderSide(context),
      padding: _getPadding(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      textStyle: TextStyle(
        fontSize: _getFontSize(),
        fontWeight: FontWeight.w500,
        fontFamily: 'PingFang SC',
      ),
      disabledBackgroundColor: _getBackgroundColor(context).withOpacity(0.5),
      disabledForegroundColor: _getTextColor(context).withOpacity(0.5),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (variant == PrismButtonVariant.primary || variant == PrismButtonVariant.danger) {
          return Colors.white.withOpacity(0.1);
        }
        return PrismColors.getBrandDefault(context).withOpacity(0.1);
      }),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (disabled) {
      if (variant == PrismButtonVariant.outline || 
          variant == PrismButtonVariant.ghost || 
          variant == PrismButtonVariant.text) {
        return Colors.transparent;
      }
      return PrismColors.getBorder(context); // 如果不透明度逻辑不足，则作为禁用实心按钮的后备方案
    }
    
    switch (variant) {
      case PrismButtonVariant.primary:
        return PrismColors.getBrandDefault(context);
      case PrismButtonVariant.secondary:
        return PrismColors.getBrandDefault(context).withOpacity(0.1);
      case PrismButtonVariant.outline:
      case PrismButtonVariant.ghost:
      case PrismButtonVariant.text:
        return Colors.transparent;
      case PrismButtonVariant.danger:
        return PrismColors.getError(context);
    }
  }

  Color _getTextColor(BuildContext context) {
    if (disabled) return PrismColors.getTextSecondary(context);
    
    switch (variant) {
      case PrismButtonVariant.primary:
      case PrismButtonVariant.danger:
        return Colors.white;
      case PrismButtonVariant.secondary:
      case PrismButtonVariant.text:
        return PrismColors.getBrandDefault(context);
      case PrismButtonVariant.outline:
        return PrismColors.getTextMain(context);
      case PrismButtonVariant.ghost:
        return PrismColors.getTextSecondary(context);
    }
  }

  BorderSide? _getBorderSide(BuildContext context) {
    if (variant == PrismButtonVariant.outline && !disabled) {
      return BorderSide(color: PrismColors.getBorder(context));
    }
    return null;
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case PrismButtonSize.mini:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 0); // 高度控制垂直方向
      case PrismButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 0);
      case PrismButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 0);
      case PrismButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 0);
    }
  }

  double _getHeight() {
    switch (size) {
      case PrismButtonSize.mini:
        return 24;
      case PrismButtonSize.small:
        return 32;
      case PrismButtonSize.medium:
        return 40;
      case PrismButtonSize.large:
        return 48;
    }
  }

  double _getFontSize() {
    switch (size) {
      case PrismButtonSize.mini:
        return 12;
      case PrismButtonSize.small:
      case PrismButtonSize.medium:
        return 14;
      case PrismButtonSize.large:
        return 16;
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case PrismButtonSize.mini:
        return PrismRadius.sm;
      case PrismButtonSize.small:
        return PrismRadius.sm;
      case PrismButtonSize.medium:
      case PrismButtonSize.large:
        return PrismRadius.md;
    }
  }

  double _getIconSize() {
    switch (size) {
      case PrismButtonSize.mini:
        return 12;
      case PrismButtonSize.small:
        return 14;
      case PrismButtonSize.medium:
        return 16;
      case PrismButtonSize.large:
        return 20;
    }
  }
}
