import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme/prism_colors.dart';
import '../../theme/prism_constants.dart';

class PrismTimelineItem {
  final Widget title;
  final Widget? subtitle;
  final Widget? content;
  final Widget? icon;
  final DateTime? time;
  final bool isCompleted;

  PrismTimelineItem({
    required this.title,
    this.subtitle,
    this.content,
    this.icon,
    this.time,
    this.isCompleted = false,
  });
}

class PrismTimeline extends StatelessWidget {
  final List<PrismTimelineItem> items;

  const PrismTimeline({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final item = items[index];
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: item.isCompleted ? PrismColors.getSuccess(context).withOpacity(0.1) : PrismColors.getBgCard(context),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: item.isCompleted ? PrismColors.getSuccess(context) : PrismColors.getBorder(context),
                        width: 2,
                      ),
                    ),
                    child: item.isCompleted
                        ? Icon(Icons.check, size: 14, color: PrismColors.getSuccess(context))
                        : (item.icon ?? const SizedBox()),
                  ),
                  if (index != items.length - 1)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: PrismColors.getBorder(context).withOpacity(0.5),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: PrismColors.getTextMain(context),
                          ),
                          child: item.title,
                        )),
                        if (item.time != null)
                          Text(
                            DateFormat("HH:mm").format(item.time!),
                            style: TextStyle(
                              fontSize: 12,
                              color: PrismColors.getTextSecondary(context),
                            ),
                          ),
                      ],
                    ),
                    if (item.subtitle != null) ...[
                      const SizedBox(height: 4),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 13,
                          color: PrismColors.getTextSecondary(context),
                        ),
                        child: item.subtitle!,
                      ),
                    ],
                    if (item.content != null) ...[
                      const SizedBox(height: 8),
                      item.content!,
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
