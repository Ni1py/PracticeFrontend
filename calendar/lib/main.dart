import 'package:flutter/material.dart';
import './get_year_calendar.dart';
import './get_row_month_calendar.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[400],
        body: ListView.builder(
          itemCount: 80,
          itemBuilder: (BuildContext context, int index) {
            return getYearCalendar(2022 + index);
          },
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color.fromARGB(255, 138, 10, 161), Color.fromARGB(255, 205, 12, 66)]
              )
            ),
          ),
          title: const Center(
            child: Text(
              "Calendar", 
              style: TextStyle(
                color: Color.fromARGB(255, 248, 137, 244),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            )
          )
        ),
      )
    );
  }
}
