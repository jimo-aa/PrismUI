import 'package:flutter/material.dart';

class PrismPageContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double? maxWidth;
  final Alignment alignment;

  const PrismPageContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.maxWidth,
    this.alignment = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: padding,
        constraints: maxWidth != null
            ? BoxConstraints(maxWidth: maxWidth!)
            : null,
        child: child,
      ),
    );
  }
}
