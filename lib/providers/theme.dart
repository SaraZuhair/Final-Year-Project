import 'package:flutter/material.dart';


class Themechanger with ChangeNotifier{
  
  
  late ThemeData themdata;


  Themechanger(this.themdata);

  getTheme()=>themdata;
  

  setTheme(ThemeData theme){
   themdata=theme;
  



   notifyListeners();
  }
}