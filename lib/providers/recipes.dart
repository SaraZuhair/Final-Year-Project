


import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';


class Recipes extends ChangeNotifier
{
  List<Map> food=  [];
 

  Future getrecipes() async
  {
    var url = "https://recipe-project-27f3b-default-rtdb.firebaseio.com/recipes.json";

   var response = await http.get(Uri.parse(url),);
  // print(response.body);
  var data = json.decode(response.body) as Map;

  data.forEach((id, content) {
    food.add({
      'id':id,
      'name':content['name'],
      'calories':content['calories'],
      'ingredients':content['ingredients'],
    },);
   });
  
print(food[0]['ingredients'][0]);


// r
// ListView.builder(
//   itemBuilder: (context, index) {
//     return ListTile(
//       title: r[index]['name']
//     ),
//     ontap:(){
//       details(r[index])
//     }
//   })
//   a['name']
//   a[]
//   )


  

  }
  
}