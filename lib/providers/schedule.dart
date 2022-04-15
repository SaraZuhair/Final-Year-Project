import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  List<Map> calendarList = [];

  Schedule(this.calendarList);

  Future<void> getschedule() async {
    calendarList = [];

    await FirebaseFirestore.instance
        .collection('calendar')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

        calendarList.add({
          'titleinfo': data['title'],
          'detailinfo': data['detail'],
          'dateinfo': data['date'],
        });
      });
    });

//   List a = [1,2,3,4,5];

//   print(a[3]);

//   Map <dynamic,dynamic> a = {'one': 1, 'two':2, 3:3, "mhamad": 21, "sara": 10};

//   print(a["title.text"]);
  }
}
