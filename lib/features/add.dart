import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class Add extends StatefulWidget {
  //  final DateTime selected;
  var date = null;
  Add({Key? key, this.date}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

// add to UIZARD
class _AddState extends State<Add> {
  final formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
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
            onPressed: () async {},
            child: const Text("Save"),
          ))
        ],
        backgroundColor: const Color(0xffFCB234),
        title: const Center(
          child: Text("Add Calendar Information")),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FormBuilder(
              child: Column(
            children: [
              FormBuilderTextField(
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
                name: "Date",
                // know what you have to do
                // then think of a way to do it
                // not google w youtube
                // logcs cant be youtubed
                // you only had to send a simple data (date) in this case to another scree
                // and if it was null you choose another date nothing more,
                //which could have been done with either provider which you share data between screens
                //or this way sending it through a parameter and if it was null incase he didnt choose anything he will use the current date.
                //you should really devide wthe problem and solve it urself.
                //plus a widget that can be selected or tapped always has a function on tap or on slected on change etc ..
                // you can change data from there
                initialValue: widget.date ?? DateTime.now(),
                fieldHintText: "Add Date",
                inputType: InputType.date,
                format: DateFormat('EEEE, dd,MMMM,yyyy'),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today)),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
