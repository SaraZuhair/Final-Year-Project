
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_year_project/screens/profile.dart';
import 'package:final_year_project/screens/schedule.dart';
import 'package:flutter/material.dart';
import 'chat.dart';
import 'home.dart';

class Choose extends StatefulWidget {
    var currentindex;
   Choose({ Key? key, required this.currentindex }) : super(key: key);

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {



  List screen=[
  
    const Home(),
    const Schedule(),
    const Chat(),
    const Profile(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[widget.currentindex],

            bottomNavigationBar: CurvedNavigationBar(
              index: widget.currentindex,
        
        backgroundColor: Colors.transparent,
        items: const <Widget>[
        Icon(Icons.home,size: 30,),
        Icon(Icons.calendar_month,size: 30,),
        Icon(Icons.chat,size: 30,),
        Icon(Icons.person,size: 30,),
      ],
      color: const Color(0xffFCB234),
      height: 70,
      animationDuration: const Duration(
        milliseconds: 300,
      ),
      
      onTap: (index){
        setState(() {
        widget.currentindex=index;
          
        });},
    ),
    
    );
  }
}