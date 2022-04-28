
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';


class Recipes extends ChangeNotifier
{
  List<Map> food=  [];
  List<Map> suggest=[];
  


  Future getrecipes() async
  {
    food =[];
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
      'image':content['image']
    },);
    }
   );
  
}

Future<bool> searchrecipe(needed)async{
 suggest=[];

  var url = "https://recipe-project-27f3b-default-rtdb.firebaseio.com/recipes.json";
  var response = await http.get(Uri.parse(url));
  var decoded=json.decode(response.body) as Map;
 suggest.clear();
  decoded.forEach((id, content) { 
    String temp = content['name'];

    if(temp.contains(needed)){
      suggest.add({
      'id':id,
      'name':content['name'],
      'calories':content['calories'],
      'ingredients':content['ingredients'],
      'image':content['image'],
     }
    
    );
    // for (var i = 0; i < suggest.length; i++) {
    //      print(suggest[i]['image']);
    // }

    }
  
  });
 
  notifyListeners();
 return false;
  }
  

}