import 'package:final_year_project/providers/userprv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Notifiedprofile extends StatefulWidget {
  const Notifiedprofile({ Key? key }) : super(key: key);

  @override
  State<Notifiedprofile> createState() => _NotifiedprofileState();
}

class _NotifiedprofileState extends State<Notifiedprofile> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
       body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(
                              20,
                            )),
                        color: Color(0xffFCB234),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/logo.png",
                                  height: 80,
                                  width: 80,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Welcome to your profile page",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "You Can View Your Information Below",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  
                ),
              ],
            ),
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