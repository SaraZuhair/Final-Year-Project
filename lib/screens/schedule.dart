import 'package:final_year_project/features/add.dart';
import 'package:final_year_project/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/schedule.dart';
import '../providers/userprv.dart';

class Scheduleinfo extends StatefulWidget {
  const Scheduleinfo({Key? key}) : super(key: key);

  @override
  State<Scheduleinfo> createState() => _ScheduleinfoState();
}

class _ScheduleinfoState extends State<Scheduleinfo> {
  DateTime? _selectedDay;

  DateTime? _focusedDay;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var clndr = Provider.of<Schedule>(context);
    Themechanger theme = Provider.of<Themechanger>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        backgroundColor: const Color(0xffFCB234),
        leading: Image.asset(
          "assets/images/logo.png",
          height: 100,
          width: 100,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Column(
              children: const [
                Text(
                  "Set your own meal schedule",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(70),
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.add), Text("Add Friend")],
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffFCB234),
                        ))),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                child: const Text(
                  "THEMES",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(40),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      onPressed: () => theme.setTheme(ThemeData.light()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text("light Theme")],
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffFCB234),
                          ))),
                ),
              ),
              Container(
                // margin: const EdgeInsets.only(bottom:70),
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                    onPressed: () => theme.setTheme(ThemeData.dark()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text("Dark Theme")],
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black))),
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    decoration: const BoxDecoration(),
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
          onPressed: () async {
            await clndr.getschedule(user.id);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Add(date: _selectedDay)));
          }),
    );
  }
}
