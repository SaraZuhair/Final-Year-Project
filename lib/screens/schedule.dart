import 'package:flutter/material.dart';


class Schedule extends StatefulWidget {
  const Schedule({ Key? key }) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("schedule page")),
      ),
    );
  }
}