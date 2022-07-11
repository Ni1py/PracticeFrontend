import 'package:flutter/material.dart';
import './get_row_month_calendar.dart';

final dayWeek = [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' ];

Column getYearCalendar(int year) {
  List<Row> yearRow = [];
  List<Container> listContainer = [];
  listContainer.add(Container(
    width: 80,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.blue[100],
      border: Border.all(
        width: 0.5,
        color: Colors.blue,
      ),
    ),
    child: Center(child: Text('$year')),
  ));

  var k = 0;
  for (var i = 0; i < (dayWeek.length * 5 + 2); i++) {
    listContainer.add(Container(
      width: 38,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.pink[400],
        border: Border.all(
          width: 0.5,
          color: Colors.brown,
        ),
      ),
      child: Center(child: Text(dayWeek[k])),
    ));
    if (k != 6) {
      k++;
    }
    else {
      k = 0;
    }
  }

  yearRow.add(Row(children: listContainer,));

  for (var i = 1; i <= 12; i++) {
    yearRow.add(Row(children: getRowMonthCalendar(year, i),));
  }

  return Column(
    children: yearRow,
  );
}