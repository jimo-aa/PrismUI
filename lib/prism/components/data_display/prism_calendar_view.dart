import 'package:flutter/material.dart';
import '../../theme/prism_colors.dart';
import '../layout/prism_card.dart';

class PrismCalendarGrid extends StatelessWidget {
  final DateTime month;
  final Map<int, List<PrismCalendarEvent>> events;
  final Function(DateTime)? onDaySelected;

  const PrismCalendarGrid({
    super.key,
    required this.month,
    required this.events,
    this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 标题行（星期）
        Row(
          children: const [
            _WeekDayHeader("周日"),
            _WeekDayHeader("周一"),
            _WeekDayHeader("周二"),
            _WeekDayHeader("周三"),
            _WeekDayHeader("周四"),
            _WeekDayHeader("周五"),
            _WeekDayHeader("周六"),
          ],
        ),
        const SizedBox(height: 8),
        // 网格
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
              final firstDayOffset = DateUtils.firstDayOffset(month.year, month.month, MaterialLocalizations.of(context));
              
              // 计算上个月信息
              final prevMonthDate = DateTime(month.year, month.month - 1);
              final daysInPrevMonth = DateUtils.getDaysInMonth(prevMonthDate.year, prevMonthDate.month);

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: 42,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  int dayNumber;
                  bool isCurrentMonth = true;
                  DateTime cellDate;

                  if (index < firstDayOffset) {
                    // 上个月
                    dayNumber = daysInPrevMonth - (firstDayOffset - index) + 1;
                    isCurrentMonth = false;
                    cellDate = DateTime(month.year, month.month - 1, dayNumber);
                  } else if (index >= firstDayOffset + daysInMonth) {
                    // 下个月
                    dayNumber = index - (firstDayOffset + daysInMonth) + 1;
                    isCurrentMonth = false;
                    cellDate = DateTime(month.year, month.month + 1, dayNumber);
                  } else {
                    // 当前月
                    dayNumber = index - firstDayOffset + 1;
                    isCurrentMonth = true;
                    cellDate = DateTime(month.year, month.month, dayNumber);
                  }

                  final dayEvents = isCurrentMonth ? (events[dayNumber] ?? []) : <PrismCalendarEvent>[];
                  final isToday = DateUtils.isSameDay(cellDate, DateTime.now());

                  return GestureDetector(
                    onTap: () => onDaySelected?.call(cellDate),
                    child: Container(
                      decoration: BoxDecoration(
                        color: PrismColors.getBgCard(context),
                        border: Border.all(color: PrismColors.getBorder(context), width: 0.5),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 24,
                              height: 24,
                              alignment: Alignment.center,
                              decoration: isToday ? BoxDecoration(
                                color: PrismColors.getBrandDefault(context),
                                shape: BoxShape.circle,
                              ) : null,
                              child: Text(
                                "$dayNumber",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isToday 
                                      ? Colors.white 
                                      : (isCurrentMonth ? PrismColors.getTextMain(context) : PrismColors.getTextSecondary(context)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...dayEvents.take(3).map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: PrismEventChip(event: e),
                          )),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WeekDayHeader extends StatelessWidget {
  final String label;
  const _WeekDayHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: PrismColors.getTextSecondary(context),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class PrismCalendarEvent {
  final String title;
  final Color color;
  final bool isMultiDay;

  PrismCalendarEvent({
    required this.title,
    required this.color,
    this.isMultiDay = false,
  });
}

class PrismEventChip extends StatelessWidget {
  final PrismCalendarEvent event;

  const PrismEventChip({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: event.color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: event.color.withOpacity(0.3), width: 0.5),
      ),
      child: Text(
        event.title,
        style: TextStyle(
          fontSize: 10,
          color: event.color,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class PrismSuggestionCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onApply;
  final VoidCallback? onIgnore;

  const PrismSuggestionCard({
    super.key,
    required this.title,
    required this.description,
    this.onApply,
    this.onIgnore,
  });

  @override
  Widget build(BuildContext context) {
    return PrismCard(
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6366F1), Color(0xFFA855F7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: PrismColors.getBrandDefault(context),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      minimumSize: const Size(0, 32),
                    ),
                    child: const Text("应用建议", style: TextStyle(fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: onIgnore,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    minimumSize: const Size(0, 32),
                  ),
                  child: const Text("忽略", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
