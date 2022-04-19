import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme.dart';

class Ingredients extends StatefulWidget {
  Map food;
   Ingredients({ Key? key, required this.food }) : super(key: key);

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    Themechanger theme=Provider.of<Themechanger>(context);
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
         preferredSize:  const Size.fromHeight(48.0),
         child: Text(widget.food['name'], 
         style:const TextStyle(
           fontSize: 20, fontWeight: FontWeight.bold
         ) ,)
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
                    
                  
                  onPressed: ()=>theme.setTheme(ThemeData.light()),
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
        
            SizedBox(
              // margin: const EdgeInsets.only(bottom:70),
              
                width: MediaQuery.of(context).size.width*0.4,
                child: ElevatedButton(
                  
                
                onPressed: ()=> theme.setTheme(ThemeData.dark()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                   
                    Text("Dark Theme"),
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
              ),
            ],
          ),
        ),
      ),



      body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width:  MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: const [
                Text("Ingredients",
                style: TextStyle(
                  fontSize:25,
                  fontWeight: FontWeight.bold
                ),
                ),

                SizedBox(
                  height: 70,
                )
              ],
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: widget.food['ingredients'].length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                title: Text(widget.food['ingredients'][index]) ,
                ),
              );
              
            },),),
      
      
          
        ],
        ),
      ),
      ),
      
    );
  }
}