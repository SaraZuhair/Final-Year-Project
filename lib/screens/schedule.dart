import 'package:final_year_project/features/add.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  

  DateTime? _selectedDay;

  DateTime? _focusedDay;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(
                            20,
                          )),
                      color: Color(0xffFCB234),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/logo.png",
                                height: 80,
                                width: 80,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Set your owm meal schedule",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                TableCalendar(
                

                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2100),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  //on day selected function
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  headerStyle: HeaderStyle(
                    decoration: const BoxDecoration(
                        
                        ),
                    titleTextStyle: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                    formatButtonDecoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    formatButtonTextStyle: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.orange,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Add(date: _selectedDay)));
          }),
    );
  }
}
