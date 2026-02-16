import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismRadio<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String? label;
  final bool disabled;

  const PrismRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.disabled = false,
  });

  @override
  State<PrismRadio<T>> createState() => _PrismRadioState<T>();
}

class _PrismRadioState<T> extends State<PrismRadio<T>> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.value == widget.groupValue;

    return InkWell(
      onTap: widget.disabled ? null : () => widget.onChanged(widget.value),
      borderRadius: BorderRadius.circular(4),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() => _isPressed = value);
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? (widget.disabled ? PrismColors.getTextSecondary(context) : PrismColors.getBrandDefault(context))
                      : PrismColors.getBorder(context),
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.disabled
                              ? PrismColors.getTextSecondary(context)
                              : PrismColors.getBrandDefault(context),
                        ),
                      ),
                    )
                  : null,
            ),
            if (widget.label != null) ...[
              const SizedBox(width: 8),
              Text(
                widget.label!,
                style: PrismTypography.getBodyMedium(context).copyWith(
                  color: widget.disabled
                      ? PrismColors.getTextSecondary(context)
                      : PrismColors.getTextMain(context),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
