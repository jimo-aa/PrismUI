import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'prism_colors.dart';

class PrismTypography {
  static const String fontFamilySans = 'PingFang SC';
  static const String fontFamilyMono = 'JetBrains Mono';

  // 兼容性别名
  static TextStyle get h1 => displayLarge;
  static TextStyle get h2 => displayMedium;
  static TextStyle get h3 => displaySmall;
  static TextStyle get h4 => headlineMedium;
  static TextStyle get body => bodyMedium;

  static TextStyle getH1(BuildContext context) => getDisplayLarge(context);
  static TextStyle getH2(BuildContext context) => getDisplayMedium(context);
  static TextStyle getH3(BuildContext context) => getDisplaySmall(context);
  static TextStyle getH4(BuildContext context) => getHeadlineMedium(context);
  static TextStyle getBody(BuildContext context) => getBodyMedium(context);

  // 显示
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: PrismColors.textMain,
      );
  static TextStyle getDisplayLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: PrismColors.textMain,
      );
  static TextStyle getDisplayMedium(BuildContext context) => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get displaySmall => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: PrismColors.textMain,
      );
  static TextStyle getDisplaySmall(BuildContext context) => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: PrismColors.getTextMain(context),
      );

  // 标题（大）
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: PrismColors.textMain,
      );
  static TextStyle getHeadlineLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: PrismColors.textMain,
      );
  static TextStyle getHeadlineMedium(BuildContext context) => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: PrismColors.textMain,
      );
  static TextStyle getHeadlineSmall(BuildContext context) => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: PrismColors.getTextMain(context),
      );

  // 标题
  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: PrismColors.textMain,
      );
  static TextStyle getTitleLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: PrismColors.textMain,
      );
  static TextStyle getTitleMedium(BuildContext context) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: PrismColors.textMain,
      );
  static TextStyle getTitleSmall(BuildContext context) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: PrismColors.getTextMain(context),
      );

  // 正文
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: PrismColors.textMain,
      );
  static TextStyle getBodyLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: PrismColors.textSecondary,
      );
  static TextStyle getBodyMedium(BuildContext context) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: PrismColors.getTextSecondary(context),
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: PrismColors.textMuted,
      );
  static TextStyle getBodySmall(BuildContext context) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: PrismColors.getTextMuted(context),
      );

  // 标签
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: PrismColors.textMain,
      );
  static TextStyle getLabelLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: PrismColors.getTextMain(context),
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: PrismColors.textSecondary,
      );
  static TextStyle getLabelMedium(BuildContext context) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: PrismColors.getTextSecondary(context),
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: PrismColors.textMuted,
      );
  static TextStyle getLabelSmall(BuildContext context) => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: PrismColors.getTextMuted(context),
      );

  static TextTheme get lightTextTheme {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
