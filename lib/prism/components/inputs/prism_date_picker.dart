import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme/prism_colors.dart';
import 'prism_text_field.dart';
import 'prism_compact_calendar.dart';

class PrismDatePicker extends StatelessWidget {
  final String? label;
  final String? hint;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final PrismInputSize size;
  final bool enabled;
  final double? width;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const PrismDatePicker({
    super.key,
    this.label,
    this.hint = '选择日期',
    this.value,
    this.onChanged,
    this.size = PrismInputSize.medium,
    this.enabled = true,
    this.width,
    this.firstDate,
    this.lastDate,
  });

  static Future<DateTime?> show({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) {
    return showDialog<DateTime>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: PrismCompactCalendar(
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          onDateSelected: (date) {
            Navigator.of(context).pop(date);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveFirstDate = firstDate ?? DateTime(2000);
    final effectiveLastDate = lastDate ?? DateTime(2100);

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: PrismColors.getTextMain(context),
              ),
            ),
            const SizedBox(height: 6),
          ],
          InkWell(
            onTap: enabled
                ? () async {
                    final picked = await PrismDatePicker.show(
                      context: context,
                      initialDate: value ?? DateTime.now(),
                      firstDate: effectiveFirstDate,
                      lastDate: effectiveLastDate,
                    );
                    if (picked != null) {
                      onChanged?.call(picked);
                    }
                  }
                : null,
            borderRadius: BorderRadius.circular(8),
            child: IgnorePointer(
              child: SizedBox(
                height: _getHeight(),
                child: TextField(
                  readOnly: true,
                  enabled: enabled,
                  style: TextStyle(fontSize: _getFontSize()),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: PrismColors.getTextSecondary(context)),
                    suffixIcon: Icon(Icons.calendar_today, 
                      size: _getIconSize(), 
                      color: enabled ? PrismColors.getTextSecondary(context) : PrismColors.getTextSecondary(context)
                    ),
                    contentPadding: _getPadding(),
                    border: _getBorder(context),
                    enabledBorder: _getBorder(context),
                    disabledBorder: _getBorder(context),
                    focusedBorder: _getFocusedBorder(context),
                    fillColor: enabled ? PrismColors.getBgBody(context) : PrismColors.getBgBody(context).withOpacity(0.5),
                    filled: true,
                  ),
                  controller: TextEditingController(
                    text: value != null ? DateFormat('yyyy-MM-dd').format(value!) : '',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case PrismInputSize.small: return 32;
      case PrismInputSize.medium: return 40;
      case PrismInputSize.large: return 48;
    }
  }

  double _getFontSize() {
    switch (size) {
      case PrismInputSize.small: return 14;
      case PrismInputSize.medium: return 14;
      case PrismInputSize.large: return 16;
    }
  }

  double _getIconSize() {
    switch (size) {
      case PrismInputSize.small: return 14;
      case PrismInputSize.medium: return 16;
      case PrismInputSize.large: return 20;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case PrismInputSize.small:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 0);
      case PrismInputSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 0);
      case PrismInputSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 0);
    }
  }

  OutlineInputBorder _getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PrismColors.getBorder(context)),
    );
  }

  OutlineInputBorder _getFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PrismColors.getBrandDefault(context), width: 2),
    );
  }
}
