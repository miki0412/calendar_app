import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends ConsumerWidget{
  CalendarPage({super.key});

  DateTime Datetime = DateTime.now();
  DateTime FirstDay = DateTime.utc(2022,1,1);
  DateTime LastDay = DateTime.utc(2023,12,31);

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

          ),
        )
      ),
    );
  }
}