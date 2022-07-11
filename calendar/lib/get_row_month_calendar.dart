import 'package:flutter/material.dart';
import './get_month_calendar.dart';

final months = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ];

List<Container> getRowMonthCalendar(int year, int month) {
  final listDayMonth = getMonthCalendar(year, month);
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
    child: Center(child: Text(months[month - 1])),
  ));
  for (var i = 0; i < listDayMonth.length; i++) {
    for (var j = 0; j < listDayMonth[0].length; j++) {
      if (listDayMonth[i][j] == 0) {
        listContainer.add(Container(
          width: 38,
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.grey,
            border: Border(
              top: BorderSide(
                color: Colors.blueGrey,
                width: 0.5,
              ),
              bottom: BorderSide(
                color: Colors.blueGrey,
                width: 0.5,
              ),
            ),
          ),
        ));
      }
      if ((listDayMonth[i][j] != 0) && ((j != listDayMonth[0].length - 1) && (j != listDayMonth[0].length - 2))) {
        listContainer.add(Container(
          width: 38,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.cyan,
            border: Border.all(
              width: 0.5,
              color: Colors.brown,
            ),
          ),
          child: Center(child: Text('${listDayMonth[i][j]}')),
        ));
      }
      if ((listDayMonth[i][j] != 0) && ((j == listDayMonth[0].length - 1) || (j == listDayMonth[0].length - 2))) {
        listContainer.add(Container(
          width: 38,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.deepOrange[200],
            border: Border.all(
              width: 0.5,
              color: Colors.brown,
            ),
          ),
          child: Center(child: Text('${listDayMonth[i][j]}')),
        ));
      }
      if ((i == listDayMonth.length - 1) && (j == 1)) {
        break;
      }
    }
  }

  return listContainer;
}
