import 'package:flutter/material.dart';

class PrismHover extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovered) builder;
  final MouseCursor cursor;
  final VoidCallback? onTap;

  const PrismHover({
    super.key,
    required this.builder,
    this.cursor = SystemMouseCursors.click,
    this.onTap,
  });

  @override
  State<PrismHover> createState() => _PrismHoverState();
}

class _PrismHoverState extends State<PrismHover> {
  bool _isHovered = false;

  void _handleHover(bool isHovered) {
    if (_isHovered != isHovered) {
      setState(() {
        _isHovered = isHovered;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null ? widget.cursor : MouseCursor.defer,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.builder(context, _isHovered),
      ),
    );
  }
}
