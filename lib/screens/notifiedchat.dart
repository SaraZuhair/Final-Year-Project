import 'package:flutter/material.dart';

class NotifiedChat extends StatefulWidget {
  const NotifiedChat({ Key? key }) : super(key: key);

  @override
  State<NotifiedChat> createState() => _NotifiedChatState();
}

class _NotifiedChatState extends State<NotifiedChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        toolbarHeight: 100,
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
                Text("Find out who sent you notification !", 
                style:TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ) ,),
                
           ],
         )
       ),     
      ),

      endDrawer:  Drawer(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Container(
               
                margin: const EdgeInsets.all(70),
                width: MediaQuery.of(context).size.width*0.4,
                child: ElevatedButton(
                  
                
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text("Add Friend")
                  ],
                ),
                  
                style: ButtonStyle
                (
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
              
                  )
                ),
                   backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFCB234),) )
        
                ),
              ),
            
            const SizedBox(height: 200,),
             Container(
              child: const Text("THEMES", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
        
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(40),
                  width: MediaQuery.of(context).size.width*0.4,
                  child: ElevatedButton(
                    
                  
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      
                      Text("light Theme")
                    ],
                  ),
                    
                  style: ButtonStyle
                  (
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                  
                    )
                  ),
                     backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFCB234),) )
            
                  ),
              ),
            ),
        
            Container(
              // margin: const EdgeInsets.only(bottom:70),
                width: MediaQuery.of(context).size.width*0.4,
                child: ElevatedButton(
                  
                
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                   
                    Text("Dark Theme")
                  ],
                ),
                  
                style: ButtonStyle
                (
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
              
                  )
                ),
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.black) )
        
                ),
            )
        
             
            ],
          ),
        ),
      ),
    );
  }
}