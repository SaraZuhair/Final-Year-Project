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
        backgroundColor: const Color(0xffFCB234),
        title: const Text("View Requests"),
        centerTitle: true,
      ),
      

      body: ListView.builder(
        itemCount: user.requests.length ,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(user.requests[index]['name'], style: const TextStyle( fontWeight: FontWeight.bold),),
                
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width*0.80,
                  child: Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: Row(
                     
                      children: [
                        Container(
                          
                        width: 80,
                          margin: const EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green),
                              ),
                            child: const Text("Accept"),
                          onPressed: ()async{
                          await  user.Accept(user.requests[index]).then((value) => {
                          user.requests.removeAt(index),
                          
                      });
                      setState(() {
                          
                      });

                          }, 
                       
                          
                          ),
                        ),

                        Container(
                           width: 80,
                          margin: const EdgeInsets.only(right: 40),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                            ),
                            child: const Text("Decline"),
                            onPressed: ()async{
                           await user.Delete(user.requests[index]).then((value) => {
                          user.requests.removeAt(index)                        
                             }
                            );
                            setState(() {                              
                             }
                            );
                           },       
                          ),
                        )
                      ],
                    ),
                  ),
                ),

            ),
          );
        }
      ),
    );
  }
}