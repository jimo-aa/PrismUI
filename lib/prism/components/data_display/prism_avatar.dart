import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

class PrismAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? text;
  final double size;
  final bool isOnline;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  const PrismAvatar({
    super.key,
    this.imageUrl,
    this.text,
    this.size = 32,
    this.isOnline = false,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor ?? PrismColors.getBrandDefault(context).withOpacity(0.1),
            shape: BoxShape.circle,
            image: imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: imageUrl == null
              ? Center(
                  child: Text(
                    _getInitials(),
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: textColor ?? PrismColors.getBrandDefault(context),
                    ),
                  ),
                )
              : null,
        ),
        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: PrismColors.getSuccess(context),
                shape: BoxShape.circle,
                border: Border.all(color: PrismColors.getBgCard(context), width: 2),
              ),
            ),
          ),
      ],
    );
  }

  String _getInitials() {
    if (text == null || text!.isEmpty) return '';
    if (text!.length <= 2) return text!;
    return text!.substring(0, 1).toUpperCase();
  }
}
