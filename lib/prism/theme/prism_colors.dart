import 'package:flutter/material.dart';

class PrismColors {
  // 品牌色
  static const brandDefault = Color(0xFF3B82F6); // Blue-500
  static const brandLight = Color(0xFFEFF6FF); // Blue-50
  static const brandDark = Color(0xFF1D4ED8); // Blue-700

  // 背景色 - 亮色模式
  static const bgLight = Color(0xFFF9FAFB); // Gray-50
  static const bgCardLight = Colors.white;
  
  // 背景色 - 暗色模式
  static const bgDark = Color(0xFF111827); // Gray-900
  static const bgCardDark = Color(0xFF1F2937); // Gray-800
  static const bgSidebarDark = Color(0xFF111827); // Gray-900

  // 旧版
  static const bgCard = Colors.white; 
  static const bgBody = bgLight;

  // 边框
  static const border = Color(0xFFE5E7EB); // Gray-200
  static const borderDark = Color(0xFF374151); // Gray-700

  // 文本
  static const textMain = Color(0xFF1F2937); // Gray-800
  static const textDefault = textMain;
  static const textSecondary = Color(0xFF6B7280); // Gray-500
  static const textMuted = textSecondary;
  static const textLight = Color(0xFFF9FAFB); // Gray-50
  
  // 文本 - 暗色模式
  static const textMainDark = Color(0xFFF9FAFB); // Gray-50
  static const textSecondaryDark = Color(0xFF9CA3AF); // Gray-400
  static const textInverse = Colors.white;

  // 功能色
  static const error = Color(0xFFEF4444); // Red-500
  static const warning = Color(0xFFF59E0B); // Amber-500
  static const success = Color(0xFF10B981); // Emerald-500
  static const info = Color(0xFF3B82F6); // Blue-500
  
  // 动态颜色获取器
  static Color getBgBody(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? bgDark : bgLight;
  }
  
  static Color getBgCard(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? bgCardDark : bgCardLight;
  }
  
  static Color getBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? borderDark : border;
  }
  
  static Color getTextMain(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? textMainDark : textMain;
  }
  
  static Color getTextSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? textSecondaryDark : textSecondary;
  }

  static Color getTextMuted(BuildContext context) {
    return getTextSecondary(context);
  }

  static Color getBrandDefault(BuildContext context) => brandDefault;
  static Color getBrandLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark 
        ? brandDefault.withOpacity(0.1) 
        : brandLight;
  }
  static Color getBrandDark(BuildContext context) => brandDark;
  
  static Color getError(BuildContext context) => error;
  static Color getWarning(BuildContext context) => warning;
  static Color getSuccess(BuildContext context) => success;
  static Color getInfo(BuildContext context) => info;

  static Color getTextInverse(BuildContext context) => Colors.white;
}
