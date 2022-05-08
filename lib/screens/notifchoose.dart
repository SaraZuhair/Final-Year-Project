import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_year_project/screens/notifiedchat.dart';
import 'package:final_year_project/screens/notiprofile.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class NotifiedChoose extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var currentindex;

   NotifiedChoose({ Key? key, required this.currentindex }) : super(key: key);

  @override
  State<NotifiedChoose> createState() => _NotifiedChooseState();
}

class _NotifiedChooseState extends State<NotifiedChoose> {


List screen=[
     const NotifiedChat(),
     const Notifiedprofile( ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: screen[widget.currentindex],

            bottomNavigationBar: CurvedNavigationBar(
              index: widget.currentindex,
        
        backgroundColor: Colors.transparent,
        items: const <Widget>[
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