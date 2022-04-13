import 'package:flutter/material.dart';

class NotifiedChat extends StatefulWidget {
  const NotifiedChat({ Key? key }) : super(key: key);

  @override
  State<NotifiedChat> createState() => _NotifiedChatState();
}

class _NotifiedChatState extends State<NotifiedChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
        ),
        backgroundColor:const Color(0xffFCB234),
        leading: Image.asset(
                                  "assets/images/logo.png",
                                  height: 100,
                                  width: 100,
                                ),
        
       bottom:  PreferredSize(
         preferredSize: const Size.fromHeight(48.0),
         child: Column(
         
           children: const [
                Text("Find out who sent you notification !", 
                style:TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ) ,),
                
           ],
         )
       ),     
      ),

      endDrawer: const Drawer(),
    );
  }
}