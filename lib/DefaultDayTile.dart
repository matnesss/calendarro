import 'package:calendarro/Calendarro.dart';
import 'package:calendarro/DateUtils.dart';
import 'package:flutter/material.dart';

class CalendarroDayItem extends StatelessWidget {
  CalendarroDayItem({this.date, this.calendarroState});

  DateTime date;
  CalendarroState calendarroState;

  @override
  Widget build(BuildContext context) {
    bool isWeekend = DateUtils.isWeekend(date);
    var textColor = isWeekend ? Colors.grey : Colors.black;
    bool isToday = DateUtils.isToday(date);
    calendarroState = Calendarro.of(context);

    bool daySelected = calendarroState.isDateSelected(date);

    BoxDecoration boxDecoration;
    if (daySelected) {
      boxDecoration = BoxDecoration(color: Colors.blue, shape: BoxShape.circle);
    } else if (isToday) {
      boxDecoration = BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          shape: BoxShape.circle);
    }

    return Expanded(
        child: GestureDetector(
          child: Container(
              height: 40.0,
              decoration: boxDecoration,
              child: Center(
                  child: Text(
                    "${date.day}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor),
                  ))),
          onTap: handleTap,
          behavior: HitTestBehavior.translucent,
        ));
  }

  void handleTap() {
    print("onTap : $date");

    calendarroState.setSelectedDate(date);
    calendarroState.setCurrentDate(date);
  }
}