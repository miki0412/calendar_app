import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends ConsumerWidget{
  CalendarPage({super.key});

  DateTime Datetime = DateTime.now();
  DateTime FirstDay = DateTime.utc(2022,1,1);
  DateTime LastDay = DateTime.utc(2023,12,31);
  Color _textColor(DateTime day) {
    const _defaultTextColor = Colors.black;

    if(day.weekday == DateTime.sunday){
      return Colors.red;
    }
    if(day.weekday == DateTime.saturday){
      return Colors.blue;
    }
    return _defaultTextColor;
  }

  @override
  Widget build(BuildContext context,WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        title: const Text('カレンダー'),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child:TableCalendar<dynamic>(
          headerStyle: const HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
          ),
          firstDay: FirstDay,
          lastDay: LastDay,
          focusedDay: Datetime,
          locale: 'ja_JP',
          calendarBuilders: CalendarBuilders(
            dowBuilder: (_,day) {//dowBuilder:曜日のセル(月、火、水、木、金、土、日）に対して編集をする
              if (day.weekday == DateTime.sunday){
              return const Center(
                child: Text("日",
                  style: TextStyle(color:Colors.red),
                ),
              );
            }
              if(day.weekday == DateTime.saturday){
                return const Center(
                  child:Text("土",
                    style: TextStyle(color: Colors.blue),
                  ),
                );
              }
              return null;},
            defaultBuilder: (BuildContext context,DateTime day,DateTime focusedDay){//defaultBuilder:日にちのセルに対して編集する
              return Text(
                  day.day.toString(),
                  style: TextStyle(
                    color: _textColor(day),
                  ),
              );
            }
          ),
        )
      ),
    );
  }
}