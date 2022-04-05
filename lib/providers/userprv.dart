

import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String name;
  String age;
  String address;
  String email;
  String phone;


  UserProvider({
    required this.name, 
    required this.age, 
    required this.email, 
    required this.address, 
    required this.phone
    
    }
  );


  
}