import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  String name;
  String age;
  String address;
  String email;
  String phone;
  String usertype;

  UserProvider(
      {required this.name,
      required this.age,
      required this.email,
      required this.address,
      required this.phone,
      required this.usertype
      });

  Future<void> getUser(email, password) async {
   
    await FirebaseFirestore.instance
        .collection('UserData')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
       
        if (email == data['email'] && password == data['password']) {
          name = data['name'];
          age = data['age'];
          address = data['address'];
          email = data['email'];
          phone = data['phone'];
          usertype=data['usertype'];
          
        }
      });
    });
   
  }


     
}
