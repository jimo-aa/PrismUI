import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

class PrismPopover extends StatelessWidget {
  final Widget child;
  final Widget content;
  final double width;
  final BoxConstraints? constraints;

  const PrismPopover({
    super.key,
    required this.child,
    required this.content,
    this.width = 300,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return GestureDetector(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: child,
        );
      },
      menuChildren: [
        Container(
          width: width,
          constraints: constraints,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: PrismColors.getBgCard(context),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: PrismColors.getBorder(context)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: content,
        ),
      ],
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: child,
    );
  }
}
