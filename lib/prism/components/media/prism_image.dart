import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../feedback/prism_loading.dart';

class PrismImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final bool enablePreview;
  final Widget? placeholder;
  final Widget? errorWidget;

  const PrismImage({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 8,
    this.enablePreview = true,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (src.startsWith('http')) {
      image = Image.network(
        src,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: placeholder ??
                PrismLoading(size: 24, color: PrismColors.getTextMuted(context)),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: errorWidget ??
                Icon(Icons.broken_image, color: PrismColors.getTextMuted(context)),
          );
        },
      );
    } else {
      image = Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: errorWidget ??
                Icon(Icons.broken_image, color: PrismColors.getTextMuted(context)),
          );
        },
      );
    }

    final roundedImage = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: image,
    );

    if (enablePreview) {
      return GestureDetector(
        onTap: () => _showPreview(context),
        child: roundedImage,
      );
    }

    return roundedImage;
  }

  void _showPreview(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              child: src.startsWith('http')
                  ? Image.network(src)
                  : Image.asset(src),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
