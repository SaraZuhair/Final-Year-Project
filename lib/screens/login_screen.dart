import 'package:final_year_project/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Register_Screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   late FocusNode passFocusNode;


 @override
  void initState(){
    // TODO: implement initState
    super.initState();

    passFocusNode=FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Container(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(20,)),
                color: Color(0xffFCB234),
              ),
                
              child: Column(
                children:[ 
                  
                  Row(
                  children: [
                    Image.asset("assets/images/logo.png",
                      height: 100,
                      width: 100,
                      ),
                       ],
                ),
                      
          
                      
                     
                            Container(
                              margin: const EdgeInsets.only(top: 70),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                
                              children: const [
                                Text("Login",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
        
        
          const SizedBox(
            height: 50,
          ),
        
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width*.8,
              child: Column(
                children:  [
                  TextField(
             
                    onSubmitted: (_){
                      FocusScope.of(context).requestFocus(passFocusNode);
                    },
                  decoration: const InputDecoration(  
                  labelText: "Email",  
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color: Colors.orange),   
                ),
              ),                   
            ),
        
        
                const SizedBox(
                    height: 40,
                  ),
        
        
               TextField(
                  focusNode: passFocusNode,
                  decoration: const InputDecoration(  
                  labelText: "Password",  
                  labelStyle: TextStyle(color: Colors.black),    
                  enabledBorder: UnderlineInputBorder(      
                  borderSide: BorderSide(color: Colors.orange),   
                  ),
                 ),
                ),
                
                const SizedBox(
                  height: 30,
                ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
               const Text("Don't have an account?",
               style: TextStyle(
                 color: Colors.grey
                 ),
               ),

              const SizedBox(
                width: 8,
              ),


                GestureDetector(
                  child: const Text("Sign UP",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                 color: Colors.orange
                  ),
                ),
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) => const RegisterScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10,),

              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                    primary: const Color(0xffFCB234),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    
                child: const Text('Login'),
                onPressed: () {},
                     ),
                   ),
                 ],
               ),
             ),
           ],
          ),
        ),
      ),
    );
  }
}