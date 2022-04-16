import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../providers/schedule.dart';
import '../providers/userprv.dart';

class Add extends StatefulWidget {
  //  final DateTime selected;
  var date = null;
  Add({Key? key, this.date}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

// add to UIZARD
class _AddState extends State<Add> {
  final TextEditingController title = TextEditingController();
  final TextEditingController detail = TextEditingController();
  final TextEditingController schedule = TextEditingController();
  final formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var clndr = Provider.of<Schedule>(context);
    var user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
            ),
            onPressed: () async {
              clndr.addschedule(title.text, detail.text, schedule.text, user.id );
              clndr.calendarList.add({
                'titleinfo': title.text,
                'dateinfo': schedule.text,
                'detailinfo': detail.text
              });
              clndr.notifyListeners();
            },
            child: const Text("Save"),
          ))
        ],
        backgroundColor: const Color(0xffFCB234),
        title: const Center(child: Text("Add Calendar Information")),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FormBuilder(
              child: Column(
            children: [
              FormBuilderTextField(
                controller: title,
                name: "title",
                decoration: const InputDecoration(
                    hintText: "Add Title",
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.title_sharp)),
              ),
              const Divider(
                color: Colors.orange,
              ),
              FormBuilderTextField(
                controller: detail,
                name: "description",
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                    hintText: "add details",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.short_text)),
              ),
              const Divider(
                color: Colors.orange,
              ),
              FormBuilderDateTimePicker(
                controller: schedule,
                name: "Date",
                initialValue: widget.date ?? DateTime.now(),
                fieldHintText: "Add Date",
                inputType: InputType.date,
                format: DateFormat('EEEE, dd,MMMM,yyyy'),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today)),
              ),

              //listview.builder

              const SizedBox(
                height: 50,
              ),

              const Text(
                "Your Meal Schedule",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          color: const Color(0xffFCB234),
                          child: Column(children: [
                            Text(
                              "${clndr.calendarList[index]["titleinfo"]}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${clndr.calendarList[index]["detailinfo"]}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${clndr.calendarList[index]["dateinfo"]}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            )
                          ]),
                        ),
                      );
                    },
                    itemCount: clndr.calendarList.length,
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
