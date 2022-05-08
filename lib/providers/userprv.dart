
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name;
  String age;
  String address;
  String email;
  String phone;
  String usertype;
  int id = 0;
  List<Map> result=[];
  List<Map> friends=[];
  var docID='';

  UserProvider({
    required this.name,
    required this.age,
    required this.email,
    required this.address,
    required this.phone,
    required this.usertype,
    required this.id,
  });



  Future<void> getUser(eml, password) async {
    await FirebaseFirestore.instance
        .collection('UserData')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      

        if (eml == data['email'] && password == data['password']) {
          id = data["id"];
          name = data['name'];
          age = data['age'];
          address = data['address'];
          email = data['email'];
          phone = data['phone'];
          usertype = data['usertype'];  
          docID=doc.id;

        }
      });
    });

     await FirebaseFirestore.instance
        .collection('UserData').doc(docID).collection('friends').get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> fData = doc.data()! as Map<String, dynamic>;
        friends.add({'name' : fData['name'], 'id':fData['id']});

        
      });
    });
    notifyListeners();
  }






Future<void> searchUser( String name) async {
result=[];
name=name.trim();
result.clear();
  var  db = FirebaseFirestore.instance;
 await db.collection("UserData").get().then((event) {
  for (var doc in event.docs) {
    // print("${doc.id} => ${doc.data()}");
var temp =doc.data()['name'] as String;
  if(temp.contains(name) && name !=' ' && name !=''&& temp != this.name && doc.data()['usertype']=='Notified')
        {
          result.add(
            {
              "name": temp,
              "id": doc.id, 
            }
          );
        }
      }
    }
  );
}






Future <void > addfriend(friendInfo) async{
  var  db = FirebaseFirestore.instance;

db
  .collection('UserData').doc(docID).collection('friends').add({'name':friendInfo['name'],'id':friendInfo['id']});
friends.add({'name':friendInfo['name'],'id':friendInfo['id']});
}


  
}
