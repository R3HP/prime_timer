import 'package:flutter/material.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  String _time = "";
  String dayName = '';
  String monthName = '';
  String dayDate = '';
  String weekNumber = '';
  final dayNames = ['SO', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA'];
  final monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final hours = now.hour.toString().padLeft(2, '0');
    final minutes = now.minute.toString().padLeft(2, '0');

    setState(() {
      _time = "$hours:$minutes";
      dayName = dayNames[now.weekday % 7];
      dayDate = now.day.toString();
      monthName = monthNames[now.month - 1];
      weekNumber = 'KW ${(((now.day - 1) ~/ 7) + 1)}';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dateInfoTextStyle = TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Monospace',
          );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _time,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monospace',
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$dayName.',
              style: dateInfoTextStyle,
            ),
            Text(
                '$dayDate.',
              style: dateInfoTextStyle,
            ),
            Text(
              '$monthName.',
              style: dateInfoTextStyle,
            ),
            Text(
              ' $weekNumber',
              style: dateInfoTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    );
  }
}
