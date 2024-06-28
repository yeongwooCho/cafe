import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class MainCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final OnDaySelected onDaySelected;

  const MainCalendar({
    super.key,
    required this.selectedDate,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.none,
      locale: 'ko_kr',
      daysOfWeekHeight: 40.0,
      focusedDay: selectedDate,
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      selectedDayPredicate: (DateTime dateTime) {
        return dateTime.year == selectedDate.year &&
            dateTime.month == selectedDate.month &&
            dateTime.day == selectedDate.day;
      },
      onDaySelected: onDaySelected,
      headerStyle: getHeaderStyle(),
      calendarStyle: getCalendarStyle(),
    );
  }

  HeaderStyle getHeaderStyle() {
    return const HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: MyTextStyle.bodyMedium,
    );
  }

  CalendarStyle getCalendarStyle() {
    return CalendarStyle(
      cellMargin: const EdgeInsets.all(4),
      // markerMargin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.3),
      isTodayHighlighted: false,
      defaultDecoration: BoxDecoration(
        color: MyColor.lightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      weekendDecoration: BoxDecoration(
        color: MyColor.lightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      selectedDecoration: BoxDecoration(
        // color: PRIMARY_COLOR,
        border: Border.all(
          color: MyColor.primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      defaultTextStyle: MyTextStyle.descriptionMedium,
      weekendTextStyle: MyTextStyle.descriptionMedium,
      selectedTextStyle: MyTextStyle.descriptionMedium.copyWith(
        color: MyColor.primary,
      ),
    );
  }
}
