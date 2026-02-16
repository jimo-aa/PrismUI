import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

class PrismAppShell extends StatelessWidget {
  final Widget? sidebar;
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final Color? backgroundColor;

  const PrismAppShell({
    super.key,
    this.sidebar,
    this.header,
    required this.body,
    this.footer,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? PrismColors.getBgBody(context),
      body: Row(
        children: [
          if (sidebar != null) sidebar!,
          Expanded(
            child: Column(
              children: [
                if (header != null) header!,
                Expanded(
                  child: body,
                ),
                if (footer != null) footer!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
