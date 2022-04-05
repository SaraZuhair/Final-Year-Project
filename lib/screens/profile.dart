
import 'package:final_year_project/screens/choose.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
           
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width,
                   decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(20,)),
                color: Color(0xffFCB234),
              ),

              child: Column(
                
                children: [
                  Row(
                    
                    children: [
                      Image.asset("assets/images/logo.png", height: 80, width: 80,)],),
                  

                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Welcome to your profile page", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                      SizedBox(
                        height: 20,
                      ),
                     
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                           Text("You Can View Your Information Below",style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold
                           ),),
                        ],
                      )
                    
                ],
              ),
                )
              ],
            )
          ],
        ),
        
      ));

    
    
  }
}
