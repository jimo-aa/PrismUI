import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import 'prism_text_field.dart';

class PrismSelect<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final PrismInputSize size;
  final bool enabled;
  final double? width;
  final Widget? prefixIcon;

  const PrismSelect({
    super.key,
    this.label,
    this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.size = PrismInputSize.medium,
    this.enabled = true,
    this.width,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    Widget? selectedWidget;
    if (value != null) {
      try {
        final selectedItem = items.firstWhere((item) => item.value == value);
        selectedWidget = selectedItem.child;
      } catch (e) {
      }
    }

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
          MenuAnchor(
            builder: (context, controller, child) {
              return InkWell(
                onTap: enabled ? () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                } : null,
                borderRadius: BorderRadius.circular(8),
                child: InputDecorator(
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: PrismColors.getTextSecondary(context)),
                    prefixIcon: prefixIcon,
                    contentPadding: _getPadding(),
                    border: _getBorder(context),
                    enabledBorder: _getBorder(context),
                    focusedBorder: _getFocusedBorder(context),
                    fillColor: enabled ? PrismColors.getBgBody(context) : PrismColors.getBgBody(context).withOpacity(0.5),
                    filled: true,
                    suffixIcon: Icon(Icons.keyboard_arrow_down, size: 20, color: enabled ? PrismColors.getTextSecondary(context) : PrismColors.getTextSecondary(context)),
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: _getFontSize(),
                      color: enabled ? PrismColors.getTextMain(context) : PrismColors.getTextSecondary(context),
                      fontFamily: 'PingFang SC',
                    ),
                    child: selectedWidget ?? (hint != null ? Text(hint!, style: TextStyle(color: PrismColors.getTextSecondary(context))) : const SizedBox()),
                  ),
                ),
              );
            },
            menuChildren: items.map((item) {
              return MenuItemButton(
                onPressed: enabled ? () => onChanged?.call(item.value) : null,
                child: item.child,
              );
            }).toList(),
            style: MenuStyle(
              backgroundColor: MaterialStateProperty.all(PrismColors.getBgCard(context)),
              surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8)),
              maximumSize: MaterialStateProperty.all(const Size(400, 300)),
            ),
          ),
        ],
      ),
    );
  }


  double _getFontSize() {
    switch (size) {
      case PrismInputSize.small: return 14; 
      case PrismInputSize.medium: return 14;
      case PrismInputSize.large: return 16;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case PrismInputSize.small:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 8);
      case PrismInputSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 12);
      case PrismInputSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 14);
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
