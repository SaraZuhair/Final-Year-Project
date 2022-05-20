import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/userprv.dart';

class Message_page extends StatefulWidget {
  var friendname;
  var friendid;
   Message_page( this.friendid, this.friendname,  {Key? key}) : super(key: key);

  @override
  State<Message_page> createState() => _Message_pageState();
}

class _Message_pageState extends State<Message_page> {






       
final messagecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
     var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFCB234),
        title: Center(child: Text(widget.friendname)),
      ),

    body: SingleChildScrollView(
      child: Container(
        margin:const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
    
    
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        
            Row(
            
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height*0.7,
                  child:  ListView.builder(
                    reverse: false,
                    itemCount: user.chats.length,
                    itemBuilder: ((context, index) {
                    
                    return Card(
                      child: ListTile (
                       title:  Text (user.chats[index]),
                      ),
                    );
                  }
                )
              ),
            ),
          ],
        ),
            Row(
              children:  [
                 Expanded(
                  child: SingleChildScrollView(
                    child: TextField(
                    
                      controller: messagecontroller,
                      decoration: const InputDecoration(
                        labelText: "send a message ...",
                        ),
                        
                      ),
                  ),
                  ),
        
                IconButton(
                  color: Colors.blue,
                  onPressed: (){
                     user.sendmessage(widget.friendid, messagecontroller.text);
                  }
                , icon: const Icon(Icons.send))
                ],
              ),
            
          ]
        ),
    ),
    ));
  }
}