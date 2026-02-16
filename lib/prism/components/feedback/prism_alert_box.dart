import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

enum PrismAlertVariant { info, warning, error, success }

class PrismAlertBox extends StatelessWidget {
  final String message;
  final PrismAlertVariant variant;
  final IconData? icon;

  const PrismAlertBox({
    super.key,
    required this.message,
    this.variant = PrismAlertVariant.info,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color border;
    Color text;
    IconData defaultIcon;

    switch (variant) {
      case PrismAlertVariant.warning:
        bg = PrismColors.getWarning(context).withOpacity(0.1);
        border = PrismColors.getWarning(context).withOpacity(0.3);
        text = Colors.orange[800]!;
        defaultIcon = Icons.warning_amber_rounded;
        break;
      case PrismAlertVariant.error:
        bg = PrismColors.getError(context).withOpacity(0.1);
        border = PrismColors.getError(context).withOpacity(0.3);
        text = PrismColors.getError(context);
        defaultIcon = Icons.error_outline;
        break;
      case PrismAlertVariant.success:
        bg = PrismColors.getSuccess(context).withOpacity(0.1);
        border = PrismColors.getSuccess(context).withOpacity(0.3);
        text = PrismColors.getSuccess(context);
        defaultIcon = Icons.check_circle_outline;
        break;
      case PrismAlertVariant.info:
      bg = PrismColors.getBrandDefault(context).withOpacity(0.1);
        border = PrismColors.getBrandDefault(context).withOpacity(0.3);
        text = PrismColors.getBrandDefault(context);
        defaultIcon = Icons.info_outline;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? defaultIcon, size: 20, color: text),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 13,
                color: text,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
