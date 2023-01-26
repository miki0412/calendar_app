import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar/view/color_model.dart';

class CalendarPage extends ConsumerWidget{
  CalendarPage({super.key});

  DateTime Datetime = DateTime.now();
  DateTime FirstDay = DateTime.utc(2022,1,1);
  DateTime LastDay = DateTime.utc(2023,12,31);

  Color _textColor(DateTime day) {
    if(day.weekday == DateTime.sunday){
      return ColorModel.red;
    }
    if(day.weekday == DateTime.saturday){
      return ColorModel.blue;
    }
    return ColorModel.primary;
  }

  @override
  Widget build(BuildContext context,WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        title: const Text('カレンダー'),
      ),
      body:Center(
        child:TableCalendar<dynamic>(
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          firstDay: FirstDay,
          lastDay: LastDay,
          focusedDay: Datetime,
          locale: 'ja',
          calendarBuilders: CalendarBuilders(
            dowBuilder: (_,day) {//dowBuilder:曜日のセル(月、火、水、木、金、土、日）に対して編集をする
              final text = DateFormat.E('ja').format(day);
                if(day.weekday == DateTime.sunday){
                  return Center(
                      child:Text(
                        text,
                        style: const TextStyle(color:ColorModel.red),
                      )
                  );
                }
                if(day.weekday == DateTime.saturday){
                  return Center(
                    child:Text(
                      text,
                      style: const TextStyle(color: ColorModel.blue),
                    )
                  );
                }
                return null;
            },
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