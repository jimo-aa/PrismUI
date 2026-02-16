import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';
import '../../theme/prism_constants.dart';

enum PrismToastType { success, error, warning, info }
enum PrismToastPosition { topRight, bottomCenter }

class PrismToast {
  static OverlayEntry? _currentEntry;

  static void show(
    BuildContext context,
    String message, {
    PrismToastType type = PrismToastType.info,
    Duration duration = const Duration(seconds: 3),
    PrismToastPosition position = PrismToastPosition.bottomCenter,
  }) {
    _currentEntry?.remove();
    _currentEntry = null;

    final overlay = Overlay.of(context);
    late final OverlayEntry overlayEntry;
    
    overlayEntry = OverlayEntry(
      builder: (context) => _buildPositionedWidget(
        context: context,
        position: position,
        child: _PrismToastWidget(
          message: message,
          type: type,
          position: position,
          onDismiss: () {
            if (_currentEntry == overlayEntry) {
              _currentEntry?.remove();
              _currentEntry = null;
            }
          },
        ),
      ),
    );

    _currentEntry = overlayEntry;
    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      if (_currentEntry == overlayEntry) {
        overlayEntry.remove();
        _currentEntry = null;
      }
    });
  }

  static Widget _buildPositionedWidget({
    required BuildContext context,
    required PrismToastPosition position,
    required Widget child,
  }) {
    switch (position) {
      case PrismToastPosition.topRight:
        return Positioned(
          top: 40,
          right: 40,
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        );
      case PrismToastPosition.bottomCenter:
        return Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: child,
            ),
          ),
        );
    }
  }
}

class _PrismToastWidget extends StatefulWidget {
  final String message;
  final PrismToastType type;
  final VoidCallback onDismiss;
  final PrismToastPosition position;

  const _PrismToastWidget({
    required this.message,
    required this.type,
    required this.onDismiss,
    required this.position,
  });

  @override
  State<_PrismToastWidget> createState() => _PrismToastWidgetState();
}

class _PrismToastWidgetState extends State<_PrismToastWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // 根据位置确定滑动方向
    final beginOffset = widget.position == PrismToastPosition.bottomCenter 
        ? const Offset(0, 1.0)
        : const Offset(0, -0.5);

    _offset = Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    switch (widget.type) {
      case PrismToastType.success:
        return PrismColors.getSuccess(context).withOpacity(0.95);
      case PrismToastType.error:
        return PrismColors.getError(context).withOpacity(0.95);
      case PrismToastType.warning:
        return PrismColors.getWarning(context).withOpacity(0.95);
      case PrismToastType.info:
      return const Color(0xFF333333).withOpacity(0.95);
    }
  }

  IconData _getIcon() {
    switch (widget.type) {
      case PrismToastType.success:
        return Icons.check_circle_rounded;
      case PrismToastType.error:
        return Icons.error_rounded;
      case PrismToastType.warning:
        return Icons.warning_rounded;
      case PrismToastType.info:
      return Icons.info_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _opacity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(PrismRadius.md),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIcon(), color: Colors.white, size: 18),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  widget.message,
                  style: PrismTypography.getBodyMedium(context).copyWith(
                    color: Colors.white,
                    height: 1.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
