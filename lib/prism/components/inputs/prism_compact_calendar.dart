import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/prism_colors.dart';
import '../../theme/prism_typography.dart';

class PrismCompactCalendar extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateSelected;

  const PrismCompactCalendar({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateSelected,
  });

  @override
  State<PrismCompactCalendar> createState() => _PrismCompactCalendarState();
}

class _PrismCompactCalendarState extends State<PrismCompactCalendar> {
  late DateTime _focusedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _focusedMonth = DateTime(widget.initialDate.year, widget.initialDate.month);
  }

  void _onDaySelected(DateTime day) {
    if (day.isBefore(widget.firstDate) || day.isAfter(widget.lastDate)) {
      return;
    }
    setState(() {
      _selectedDate = day;
    });
    widget.onDateSelected(day);
  }

  void _previousMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final daysInMonth = DateUtils.getDaysInMonth(_focusedMonth.year, _focusedMonth.month);
    final firstDayOfMonth = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final daysBefore = (firstDayOfMonth.weekday % 7);
    final offset = (firstDayOfMonth.weekday % 7); 

    final totalCells = daysInMonth + offset;
    final totalRows = (totalCells / 7).ceil();
    
    return Container(
      width: 280,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PrismColors.getBgCard(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: PrismColors.getBorder(context), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: _previousMonth,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.chevron_left, size: 20, color: PrismColors.getTextSecondary(context)),
                  ),
                ),
                Text(
                  DateFormat('yyyy年 MM月').format(_focusedMonth),
                  style: PrismTypography.getH4(context).copyWith(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: _nextMonth,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.chevron_right, size: 20, color: PrismColors.getTextSecondary(context)),
                  ),
                ),
              ],
            ),
          ),

          Table(
            children: [
              TableRow(
                children: ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
                    .map((day) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Center(
                            child: Text(
                              day,
                              style: PrismTypography.getBodySmall(context).copyWith(
                                color: PrismColors.getTextMuted(context),
                                fontFamily: 'Outfit',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              ...List.generate(6, (rowIndex) {
                return TableRow(
                  children: List.generate(7, (colIndex) {
                    final dayIndex = (rowIndex * 7) + colIndex - offset + 1;
                    if (dayIndex < 1 || dayIndex > daysInMonth) {
                       DateTime cellDate;
                       if (dayIndex < 1) {
                         final prevMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
                         final daysInPrevMonth = DateUtils.getDaysInMonth(prevMonth.year, prevMonth.month);
                         final prevDay = daysInPrevMonth + dayIndex;
                         cellDate = DateTime(prevMonth.year, prevMonth.month, prevDay);
                       } else {
                         final nextMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
                         final nextDay = dayIndex - daysInMonth;
                         cellDate = DateTime(nextMonth.year, nextMonth.month, nextDay);
                       }
                       
                       return _buildDayCell(context, cellDate, isCurrentMonth: false);
                    }
                    
                    final cellDate = DateTime(_focusedMonth.year, _focusedMonth.month, dayIndex);
                    return _buildDayCell(context, cellDate, isCurrentMonth: true);
                  }),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell(BuildContext context, DateTime date, {required bool isCurrentMonth}) {
    final isSelected = DateUtils.isSameDay(date, _selectedDate);
    final isToday = DateUtils.isSameDay(date, DateTime.now());
    
    return InkWell(
      onTap: () => _onDaySelected(date),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 36, // 稍小的单元格
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2), // 单元格间隔
        decoration: BoxDecoration(
          color: isSelected ? PrismColors.getBrandDefault(context) : null,
          borderRadius: BorderRadius.circular(8),
          border: isToday && !isSelected ? Border.all(color: PrismColors.getBrandDefault(context), width: 1) : null,
        ),
        child: Text(
          date.day.toString(),
          style: PrismTypography.getBodyMedium(context).copyWith(
            color: isSelected 
                ? Colors.white 
                : (isCurrentMonth 
                    ? PrismColors.getTextMain(context) 
                    : PrismColors.getTextMuted(context)),
            fontFamily: 'Outfit',
            fontWeight: isSelected || isToday ? FontWeight.w600 : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
