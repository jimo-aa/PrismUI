import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../interactive/prism_hover.dart';

class PrismSidebarItem {
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;
  final bool isActive;
  final Widget? badge;
  final bool isHeader;

  PrismSidebarItem({
    this.icon,
    required this.label,
    this.onTap,
    this.isActive = false,
    this.badge,
    this.isHeader = false,
  });
}

class PrismSidebar extends StatelessWidget {
  final Widget? logo;
  final Widget? header;
  final List<PrismSidebarItem> items;
  final Widget? footer;
  final double width;
  final bool isCollapsed;

  const PrismSidebar({
    super.key,
    this.logo,
    this.header,
    required this.items,
    this.footer,
    this.width = 240,
    this.isCollapsed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: double.infinity,
      decoration: BoxDecoration(
        color: PrismColors.getBgCard(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (logo != null && !isCollapsed)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: logo!,
            ),
          if (header != null && !isCollapsed)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: header!,
            ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: isCollapsed ? 8 : 16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  if (item.isHeader) {
                    if (isCollapsed) return const SizedBox(height: 16);
                    return Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 8, left: 12),
                      child: Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: PrismColors.getTextSecondary(context),
                        ),
                      ),
                    );
                  }
                  return _buildSidebarItem(context, item);
                },
              ),
            ),
          ),
          if (footer != null)
            Padding(
              padding: EdgeInsets.all(isCollapsed ? 8.0 : 16.0),
              child: footer!,
            ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(BuildContext context, PrismSidebarItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: PrismHover(
        builder: (context, isHovered) {
          if (isCollapsed) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: item.isActive 
                    ? PrismColors.getBrandDefault(context).withOpacity(0.1) 
                    : isHovered 
                        ? PrismColors.getTextMain(context).withOpacity(0.05) 
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: item.onTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: item.icon != null
                          ? Icon(
                              item.icon,
                              size: 20,
                              color: item.isActive 
                                  ? PrismColors.getBrandDefault(context) 
                                  : PrismColors.getTextSecondary(context),
                            )
                          : Text(
                              item.label.substring(0, 1),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: item.isActive 
                                    ? PrismColors.getBrandDefault(context) 
                                    : PrismColors.getTextSecondary(context),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            );
          }

          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: item.isActive 
                  ? PrismColors.getBrandDefault(context).withOpacity(0.1) 
                  : isHovered 
                      ? PrismColors.getTextMain(context).withOpacity(0.05) 
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.circular(8),
                hoverColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      if (item.icon != null) ...[
                        Icon(
                          item.icon,
                          size: 20,
                          color: item.isActive ? PrismColors.getBrandDefault(context) : PrismColors.getTextSecondary(context),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: item.isActive ? FontWeight.w600 : FontWeight.normal,
                            color: item.isActive ? PrismColors.getBrandDefault(context) : PrismColors.getTextMain(context),
                          ),
                        ),
                      ),
                      if (item.badge != null) item.badge!,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
