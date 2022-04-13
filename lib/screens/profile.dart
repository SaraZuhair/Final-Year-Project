import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/userprv.dart';

class Profile extends StatefulWidget {
  
  // ignore: use_key_in_widget_constructors
  const Profile();

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
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
                Text("Welcome to your profile page", 
                style:TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ) ,),
                Text("You can view your information below",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
                ),
           ],
         )
       ),     
      ),

      endDrawer: const Drawer(),
      
      body: 
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
          
            ClipOval(
              child: Container(               
                height: 50,
                width: 50,
                color: Colors.white,
                child: Image.asset("assets/images/profileperson.png"),
              ),
            ),
           
         
      
                SingleChildScrollView(
                    child: 
      
                Column(
                  children:  [
                      
                    Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: const SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.person, color: Colors.black,),
                          ),
                      ),
                      title: Center(
                      child:Text(user.name, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),)),
                    ),
      
                    ),
      
                     Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: const SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.cake, color: Colors.black,),
                          ),
                      ),
                    title:  Center(
                      child:Text(user.age, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),)),
                    ),
      
                    ),
      
                    Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: const SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.location_pin, color: Colors.black,),
                          ),
                      ),
                     title: Center(
                      child:Text(user.address, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),)),
                    ),
      
                    ),
      
                    const Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.email, color: Colors.black,),
                          ),
                      ),
                      // title: Center(
                      // child:Text(user.email, style: const TextStyle(
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.bold,
                      // ),)),
                    ),
      
                    ),
      
                     Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: const SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.person, color: Colors.black,),
                          ),
                      ),
                      title: Center(
                      child:Text(user.usertype, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),)),
                    ),
      
                    ),
      
                     Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: const SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.phone, color: Colors.black,),
                          ),
                      ),
                      title: Center(
                      child:Text(user.phone, style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),)),
                    ),
      
                    ),
      
                    const Card(
      
                      elevation: 2,
                    child:ListTile(
                      leading: SizedBox(
                        height: 50,
                        width: 50,
      
                        child: ClipOval(
                          child: Icon(Icons.contact_phone, color: Colors.black,),
                          ),
                      ),
                      // title: ,
                    ),
      
                    ),
                  ],
                 ),
                )
                ]     
              ),
            
          
        ),
      );
    
  }
}
