import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme.dart';


class SearchFriend extends StatefulWidget {
  const SearchFriend({ Key? key }) : super(key: key);

  @override
  State<SearchFriend> createState() => _SearchFriendState();
}

class _SearchFriendState extends State<SearchFriend> {
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
         preferredSize: const Size.fromHeight(48.0),
         child: Column(
         
           children: const [
                Text("Add contacts into your contacts list", 
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
                  
                
                onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SearchFriend()));},
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
                    
                  
                  onPressed: ()=> theme.setTheme(ThemeData.light()),
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
                  
                
                onPressed: ()=> theme.setTheme(ThemeData.dark()),
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


    body: Column(
      children:  [
        SizedBox(
          height: MediaQuery.of(context).size.height *0.02,
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: const TextField(
                 decoration: InputDecoration(labelText: "Search for friends",
                 
                 enabledBorder: OutlineInputBorder(
                   borderSide:  BorderSide(
                     color: Color(0xffFCB234),
                   )
                 )
                 ),
                 
                 // onChanged: (value)async { 
                 
               
                 //  await recipe.searchrecipe(value).then((value) {
                 //    setState(() {
                      
                 //    });
                    
                 //  });                 
                 // },
                 
               ),
          ),
        )
      ],
    ),
     

    );
  }
}