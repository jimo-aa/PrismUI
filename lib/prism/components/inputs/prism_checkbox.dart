import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final bool disabled;

  const PrismCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.disabled = false,
  });

  @override
  State<PrismCheckbox> createState() => _PrismCheckboxState();
}

class _PrismCheckboxState extends State<PrismCheckbox> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disabled ? null : () => widget.onChanged(!widget.value),
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
                color: widget.value
                    ? (widget.disabled ? PrismColors.getTextSecondary(context) : PrismColors.getBrandDefault(context))
                    : Colors.transparent,
                border: Border.all(
                  color: widget.value
                      ? (widget.disabled ? PrismColors.getTextSecondary(context) : PrismColors.getBrandDefault(context))
                      : PrismColors.getBorder(context),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: widget.value
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
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
