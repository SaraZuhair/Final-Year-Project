import 'package:final_year_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  final formkey=GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final namecontroller=TextEditingController();
  final agecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final addresscontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final usertypecontroller=TextEditingController();
  

  late FocusNode ageFocusNode;
  late FocusNode EmailFocusNode;
  late FocusNode AddressFocusNode;
  late FocusNode PhoneFocusNode;
  late FocusNode PassFocusNode;
  late FocusNode RadioFocusNode;
  String _radioValue ="";


   @override
  void initState(){
    // TODO: implement initState
    super.initState();

    ageFocusNode=FocusNode();
    EmailFocusNode=FocusNode();
    AddressFocusNode=FocusNode();
    PhoneFocusNode=FocusNode();
    PassFocusNode=FocusNode();
    RadioFocusNode=FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ageFocusNode.dispose();
    EmailFocusNode.dispose();
    AddressFocusNode.dispose();
    PhoneFocusNode.dispose();
    PassFocusNode.dispose();
    RadioFocusNode.dispose();
    super.dispose();
  }

  void _handleRadioValueChange( value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case "Main":
          break;
        case "Notified":
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                     Container(
                      height: MediaQuery.of(context).size.height*0.13,
                    width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                           Image.asset("assets/images/logo.png",
                          height: 70,
                          width: 70,
                          ),
                          
                          const SizedBox(
                            width: 70,
                          ),
                  
                          const Text("SIGN UP",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    decoration: const BoxDecoration(
                      color: Color(0xffFCB234),
                    ),
                    ),
            
                    const SizedBox(
                      height: 20,
                    ),
            
                    
                      
                    
                      
                    
                    ],
                  ),
                )
              ],
            ),
             Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*.8,
                child: Column(
                  key: formkey,
                  children:  [
                    
                    TextField(
                      controller: namecontroller,
                      onSubmitted: (_){
                        FocusScope.of(context).requestFocus(ageFocusNode);
                      },
                   decoration: const InputDecoration(  
                    hintText: "name",  
                      labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.orange),   
                  )),                   
                  ),
                  
        
                  const SizedBox(
                      height: 15,
                    ),
        
            
                  TextField(
                    controller: agecontroller,
                    focusNode: ageFocusNode,
                      onSubmitted: (_){
                        FocusScope.of(context).requestFocus(EmailFocusNode);
                      },
                      keyboardType: TextInputType.number,
                   decoration: const InputDecoration(  
                    hintText: "age",  
                      labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.orange),   
                  )),                   
                  ),
        
                  const SizedBox(
                      height: 15,
                    ),
        
        
                  TextField(
                    controller: emailcontroller,
                    focusNode: EmailFocusNode,
                      onSubmitted: (_){
                        FocusScope.of(context).requestFocus(AddressFocusNode);
                      },
                     
                   decoration: const InputDecoration(  
                    hintText: "Email",  
                      labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.orange),   
                  )),                   
                  ),
        
                  const SizedBox(
                      height: 15,
                    ),
        
        
                  TextField(
                    controller: addresscontroller,
                    focusNode: AddressFocusNode,
                      onSubmitted: (_){
                        FocusScope.of(context).requestFocus(PhoneFocusNode);
                      },
                     
                   decoration: const InputDecoration(  
                    hintText: "Address",  
                      labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.orange),   
                  )),                   
                  ),
        
                  const SizedBox(
                      height: 15,
                    ),
        
        
                  TextField(
                    controller: phonecontroller,
                    focusNode: PhoneFocusNode,
                      onSubmitted: (_){
                        FocusScope.of(context).requestFocus(PassFocusNode);
                      },
                     keyboardType: TextInputType.number,
                  decoration: const InputDecoration(  
                    hintText: "phone",  
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.orange),   
                  )),                   
                  ),
        
                  const SizedBox(
                      height: 15,
                    ),
        
        
        
                  TextField(
                    controller: passwordcontroller,
                      focusNode: PassFocusNode,
                      onSubmitted: (_){
                        FocusScope.of(context).requestFocus(RadioFocusNode);
                      },
                     
                  decoration: const InputDecoration(  
                    hintText: "Password",  
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: Colors.orange),   
                  )),                   
                  ),
        
                  const SizedBox(
                      height: 15,
                    ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text("User Type:", style: TextStyle(fontSize: 20),),
                       Transform.scale(
                         
                         scale: 1.5,
                         child: Radio(
                           
                           focusNode: RadioFocusNode,
                           value: "main", 
                           groupValue: _radioValue, 
                           onChanged: (value)=>_handleRadioValueChange(value),activeColor: Colors.orange,
                           ),
                          ),
                       const Text("Main"),
        
                       const SizedBox(width: 5,),
        
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          
                          value: "notified",
                          groupValue: _radioValue, 
                          onChanged: (value)=>_handleRadioValueChange(value), 
                          activeColor: Colors.orange,
                          )
                        ),
                      const Text("Notified"),
                    ],
                  ),
        
        
                  const SizedBox(
                      height: 25,
                    ),
        
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    
                    primary: const Color(0xffFCB234),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                    
                child: const Text('Sign UP'),
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailcontroller.text, password: passwordcontroller.text
                    ).then((value) => {
                      print("user created"),
                      Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()))
                    }).onError((error, stackTrace) {
                      throw(error.toString());
                    }) ;
                   
        
                },
            ),
              ),
                  
                  ],
               ),
            ),
          ],
          
        ),
      ),
    );
  }
}