import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';

class PrismSplitView extends StatefulWidget {
  final Widget left;
  final Widget right;
  final double initialRatio;
  final double minRatio;
  final double maxRatio;
  final bool isVertical;

  const PrismSplitView({
    super.key,
    required this.left,
    required this.right,
    this.initialRatio = 0.5,
    this.minRatio = 0.2,
    this.maxRatio = 0.8,
    this.isVertical = false,
  });

  @override
  State<PrismSplitView> createState() => _PrismSplitViewState();
}

class _PrismSplitViewState extends State<PrismSplitView> {
  late double _ratio;
  bool _isHovering = false;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _ratio = widget.initialRatio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = widget.isVertical ? constraints.maxHeight : constraints.maxWidth;
        
        return widget.isVertical
            ? Column(
                children: _buildChildren(size),
              )
            : Row(
                children: _buildChildren(size),
              );
      },
    );
  }

  List<Widget> _buildChildren(double totalSize) {
    final isActive = _isHovering || _isDragging;
    
    return [
      SizedBox(
        width: widget.isVertical ? double.infinity : totalSize * _ratio,
        height: widget.isVertical ? totalSize * _ratio : double.infinity,
        child: widget.left,
      ),
      MouseRegion(
        cursor: widget.isVertical 
            ? SystemMouseCursors.resizeRow 
            : SystemMouseCursors.resizeColumn,
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanStart: (_) => setState(() => _isDragging = true),
          onPanEnd: (_) => setState(() => _isDragging = false),
          onPanCancel: () => setState(() => _isDragging = false),
          onPanUpdate: (details) {
            setState(() {
              final delta = widget.isVertical ? details.delta.dy : details.delta.dx;
              _ratio += delta / totalSize;
              if (_ratio < widget.minRatio) _ratio = widget.minRatio;
              if (_ratio > widget.maxRatio) _ratio = widget.maxRatio;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.isVertical ? double.infinity : (isActive ? 8 : 4),
            height: widget.isVertical ? (isActive ? 8 : 4) : double.infinity,
            color: isActive 
                ? PrismColors.getBrandDefault(context).withOpacity(0.1)
                : PrismColors.getBorder(context),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isActive 
                      ? PrismColors.getBrandDefault(context) 
                      : PrismColors.getTextSecondary(context),
                  borderRadius: BorderRadius.circular(2),
                ),
                width: widget.isVertical ? 32 : (isActive ? 4 : 2),
                height: widget.isVertical ? (isActive ? 4 : 2) : 32,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: widget.right,
      ),
    ];
  }
}
