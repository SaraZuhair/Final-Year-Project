import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  final emailController=TextEditingController();
  final formkey=GlobalKey();

@override
void dispose(){
  emailController.dispose();
}
  
  @override
  Widget build(BuildContext context) {




    // ignore: non_constant_identifier_names
    Future Resetpass() async{
      showDialog(
        context: context, 
        builder: (context) => const Center(child: CircularProgressIndicator(),));


      try{
      await FirebaseAuth.instance
      .sendPasswordResetEmail(email: emailController.text);

      Navigator.of(context).popUntil((route) => route.isFirst);
    
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFCB234),
        title: const Text("Reset Your Password"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Please enter an email to \nreset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),),
                  ],
                ),

                const SizedBox(height: 20,),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: TextFormField(
                    controller: emailController,
                    
                    decoration: InputDecoration(
                      hintText: "email",
                     enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Color(0xffFCB234),),
                    borderRadius: BorderRadius.circular(15),
                  ),
                      ),
                  ),
                ),


              const SizedBox(
                height: 50,
              ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xffFCB234)),
                  ),
                  onPressed: Resetpass, 
                  label: const Text("Reset Password"),
                  icon: const Icon(Icons.email),
                  )
            ],
          )
          ),
      ),
    );
  }
}