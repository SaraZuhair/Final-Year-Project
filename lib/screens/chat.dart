import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
                Text("Notify your family and friends", 
                style:TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ) ,),
                Text("about your needs",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
                ),
           ],
         )
       ),     
      ),

      endDrawer: const Drawer(),
      
      body: SingleChildScrollView(
      
      ),
    );
  }
}