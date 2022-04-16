import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  List<Map> calendarList = [];

  Schedule(this.calendarList);

  Future<void> addschedule(t, d, s, i) {
    Random random = new Random();
    int randomNumber = random.nextInt(10000000);
    CollectionReference calendar =
        FirebaseFirestore.instance.collection('calendar');
    return calendar
        .add({
          "title": t,
          "detail": d,
          "date": s,
          'ownerid': i,
          'id': randomNumber,
        })
        .then((value) => print("added to firestore"))
        .catchError(
          (error) => print(error),
        );
  }

  Future<void> getschedule(ownerid) async {
    calendarList = [];
    await FirebaseFirestore.instance
        .collection('calendar')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
        if (ownerid == data['ownerid']) {
          calendarList.add({
            'titleinfo': data['title'],
            'detailinfo': data['detail'],
            'dateinfo': data['date'],
            'ownerid': data['ownerid'],
            'id': data['id'],
          });
        }
      });
    });

//   List a = [1,2,3,4,5];

//   print(a[3]);

//   Map <dynamic,dynamic> a = {'one': 1, 'two':2, 3:3, "mhamad": 21, "sara": 10};

//   print(a["title.text"]);
  }
}
