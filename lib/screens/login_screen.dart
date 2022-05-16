import 'package:final_year_project/providers/recipes.dart';
import 'package:final_year_project/screens/choose.dart';
import 'package:final_year_project/screens/forgotpass.dart';
import 'package:final_year_project/screens/notifchoose.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprv.dart';
import 'Register_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode passFocusNode;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    passFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
      var r = Provider.of<Recipes>(context);
  
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(
                        20,
                      )),
                  color: Color(0xffFCB234),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
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
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  children: [
                    TextField(
                      controller: emailcontroller,
                      onSubmitted: (_) {
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
                      obscureText: true,
                      controller: passwordcontroller,
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
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Sign UP",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.orange),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const RegisterScreen()));
                          },
                        ),

                        
                      ],
                    ),
                    const SizedBox(
                          height: 3,
                        ),

                        GestureDetector(
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.orange),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Forgot_Password()));
                          },
                        ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffFCB234),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text('Login'),
                        onPressed: () async{
                              await  r.getrecipes();
                          
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text)
                              .then(
                            (value) {
                              user
                                  .getUser(emailcontroller.text,
                                      passwordcontroller.text)
                                  .then(
                                    (value) => user.usertype == 'Main'
                                        ? Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (_) => Choose(
                                              currentindex: 3,
                                            ),
                                          ))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    NotifiedChoose(
                                                        currentindex: 1)
                                                        )
                                                      )
                                                    ),
                                                  );
                                                },
                          ).onError((error, stackTrace) {
                            throw (error.toString());
                          });
                        },
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
