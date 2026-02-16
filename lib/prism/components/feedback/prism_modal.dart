import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';
import '../../theme/prism_typography.dart';

class PrismModal extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;
  final double width;
  final VoidCallback? onClose;

  const PrismModal({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.width = 500,
    this.onClose,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
    double width = 500,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => PrismModal(
        title: title,
        content: content,
        actions: actions,
        width: width,
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: width,
        constraints: const BoxConstraints(maxHeight: 800),
        decoration: BoxDecoration(
          color: PrismColors.getBgCard(context),
          borderRadius: BorderRadius.circular(PrismRadius.md),
          border: Border.all(color: PrismColors.getBorder(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 标题
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: PrismTypography.getH3(context).copyWith(color: PrismColors.getTextMain(context)),
                  ),
                  IconButton(
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: PrismColors.getTextSecondary(context)),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: PrismColors.getBorder(context)),
            // 内容
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: content,
              ),
            ),
            // 操作
            if (actions != null) ...[
              Divider(height: 1, color: PrismColors.getBorder(context)),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!.map((action) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: action,
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
