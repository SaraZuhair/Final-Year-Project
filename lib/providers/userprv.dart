
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
  List <Map> requests=[];
  String  message;
  List chats=[];

  UserProvider({
    required this.message,
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
var yesFriends = false;
  var  db = FirebaseFirestore.instance;
 await db.collection("UserData").get().then((event) {
  for (var doc in event.docs) {
    // print("${doc.id} => ${doc.data()}");
var temp =doc.data()['name'] as String;


  if(temp.contains(name) && name !=' ' && name !=''&& temp != this.name && doc.data()['usertype']=='Notified')
        {
            for (var i = 0; i < friends.length; i++) {
              if(friends[i]['id'] == doc.id){
                  yesFriends = true;
              }
            }
          if(!yesFriends){
            result.add(
            {
              "name": temp,
              "id": doc.id, 
            } );
          }
          
         
        }
        yesFriends = false;
      }
    }
  );
}






Future <bool > addfriend(friendInfo) async{
  var  db = FirebaseFirestore.instance;
  
  bool have =false;

requests.forEach((element) {
  print(element['id']);
  print(friendInfo['id']);

  if(element['id'] == friendInfo['id']){
    
    have = true;
      }
    });

    if(!have){
      db
      .collection('UserData').doc(friendInfo['id']).collection('requestfriend').add({'name': name,'id':docID});
      requests.add({'name': friendInfo['name'],'id':friendInfo['id']});
      db
      .collection('UserData').doc(docID).collection('requestfriend').add({'name': friendInfo['name'],'id':friendInfo['id']});
      
    }


  


return have;
}


Future <void> getrequests () async{
  requests=[];
  // requests.clear();
  var  db = FirebaseFirestore.instance;

await db.collection("UserData").doc(docID).collection('requestfriend').get().then((event) {
  for (var doc in event.docs) {
 
requests.add({'name': doc.data()['name'],'id':doc.data()['id']});     //doc.data returns a json always
    
}
});
}



Future Accept(req)async {
   var  db = FirebaseFirestore.instance;
   db
  .collection('UserData').doc(docID).collection('friends').add({'name':req['name'],'id':req['id']});
  db
  .collection('UserData').doc(req['id']).collection('friends').add({'name':name,'id':docID});


  await db.collection("UserData").doc(docID).collection('requestfriend').get().then((event) {
  for (var doc in event.docs) {
 
    if(doc.data()['id'] == req['id']){
        db
          .collection('UserData').doc(docID).collection('requestfriend').doc(doc.id).delete();
     }  
    }
  }
);

  await db.collection("UserData").doc(req['id']).collection('requestfriend').get().then((event) {
  for (var doc in event.docs) {
 
    if(doc.data()['id'] ==docID){
        db
          .collection('UserData').doc(req['id']).collection('requestfriend').doc(doc.id).delete();
    }
    
}
});


  friends.add({'name':req['name'], 'id': req['id']});
}



Future Delete(req)async{
  var  db = FirebaseFirestore.instance;


  await db.collection("UserData").doc(docID).collection('requestfriend').get().then((event) {
  for (var doc in event.docs) {
 
    if(doc.data()['id'] == req['id']){
        db
          .collection('UserData').doc(docID).collection('requestfriend').doc(doc.id).delete();
    }
    
}
});
 await db.collection("UserData").doc(req['id']).collection('requestfriend').get().then((event) {
  for (var doc in event.docs) {
 
    if(doc.data()['id'] ==docID){
        db
          .collection('UserData').doc(req['id']).collection('requestfriend').doc(doc.id).delete();
    }
    
}
});


 

  // requests.removeWhere((element) => element['id'] == req['id']);

}


      Future getfriendlist(req)async{
      var  db = FirebaseFirestore.instance;

      await db.collection('UserData').doc(req['id']).collection('requestfriend').get().then((value) {
      for (var doc in value.docs) {
        print(value);
      }
      });
      }



  Future<void> sendmessage(req, message) async {



     print(message);

     chats.add(message);

      print(chats);

    FirebaseFirestore
    .instance
      .collection('UserData')
        .doc(docID)
          .collection('friends')
            .doc()
              .collection('sentmessage')
                .add({'message': chats});



      FirebaseFirestore
        .instance
          .collection('UserData')
            .doc(req)
              .collection('friends')
                .doc()
                  .collection('getmessage')
                    .add({'message':chats});




               

  }


  Future getmessages() async{
    await FirebaseFirestore.instance.collection('UserData').doc(docID).collection('friends').doc()
.collection('sentmessage').get().then((value) {
for (var doc in value.docs) {
  print(value);
}
});;
  }

  

}
