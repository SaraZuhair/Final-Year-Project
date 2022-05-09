import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprv.dart';

class ViewRequests extends StatefulWidget {
  const ViewRequests({ Key? key }) : super(key: key);

  @override
  State<ViewRequests> createState() => _ViewRequestsState();
}

class _ViewRequestsState extends State<ViewRequests> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(

        title: Text("view"),
      ),
      

      body: ListView.builder(
        itemCount: user.requests.length ,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(user.requests[index]['name']),
                
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: ()async{
                    await  user.Accept(user.requests[index]).then((value) => {
                      user.requests.removeAt(index)
                      
                    });
                    setState(() {
                      
                    });

                      }, 
                      icon: Icon(Icons.add),
                      
                      ),

                      IconButton(onPressed: ()async{
                       await user.Delete(user.requests[index]).then((value) => {
                      user.requests.removeAt(index)
                      
                    });
                    setState(() {
                      
                    });
                      }, 
                      icon: Icon(Icons.cancel)
                      
                      
                      )
                    ],
                  ),
                ),

            ),
          );
        }
        
        ),
    );
  }
}