import 'dart:ui';

import 'package:final_year_project/providers/recipes.dart';
import 'package:final_year_project/providers/theme.dart';
import 'package:final_year_project/screens/ingredients.dart';
import 'package:final_year_project/screens/searchfriend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
Themechanger theme=Provider.of<Themechanger>(context);
  var recipe = Provider.of<Recipes>(context);

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
        
       bottom: const PreferredSize(
         preferredSize:  Size.fromHeight(48.0),
         child: Text("Whats on your mind today", 
         style:TextStyle(
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
                  
                
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SearchFriend()));
                },
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



         body: 
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
          SizedBox(  height: MediaQuery.of(context).size.height*0.05),
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  
                  child: TextField(
                    decoration: const InputDecoration(labelText: "Search recipe",
                    
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: Color(0xffFCB234),
                      )
                    )
                    ),
                    
                    onChanged: (value)async { 
                      imageCache.clearLiveImages();
                      imageCache.clear();
                  
                     await recipe.searchrecipe(value).then((value) {
                       setState(() {
                         
                       });
                       
                     });                 
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  height:  MediaQuery.of(context).size.height,
                  child: recipe.suggest.length==0? GridView.builder(
                  primary: false,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: recipe.food.length,
                    
                     itemBuilder: (BuildContext context, int index) { 
                        
                       return InkWell(
                         onTap: (() {
                           Navigator.push(context, MaterialPageRoute(
                             builder: (_)=> Ingredients(food: recipe.food[index]),)
                             );
                         }),
                         child: Card(
                           color: const Color(0xffFCB234),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                           child: Column(
                             children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.2,
                              decoration: BoxDecoration(
                              image:  DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(recipe.food[index]['image'],
                               
                              ),
                            ),
                          ),
                        ),
                      ),

                               
                              
                              Text(recipe.food[index]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white
                              ),
                              ),
                             ],
                           ),
                                     
                         ),
                       );
                     }, 
                  
                    
                    ) : GridView.builder(
                      primary: false,
                  
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: recipe.suggest.length,
                    
                     itemBuilder: (BuildContext context, int index) { 
                        
                       return InkWell(key: UniqueKey(),
                         onTap: () {
                          
                           Navigator.push(context, MaterialPageRoute(
                             builder: (_)=> Ingredients(food: recipe.suggest[index]),)
                             );
                         },

                         child: Card(  key: UniqueKey(),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                           color: const Color(0xffFCB234),
                           child: Column(
                             children: [
                               ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                            key: UniqueKey(),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.2,
                              decoration: BoxDecoration(
                              image:  DecorationImage(
                                
                              fit: BoxFit.fill,
                              image: NetworkImage(recipe.suggest[index]['image'],
                                                           
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              

                               Text(recipe.suggest[index]['name'],
                               style: const TextStyle(
                               fontWeight: FontWeight.bold,
                               )
                              ),
                             ],
                           ),
                                     
                         ),
                       );
                     }, 
                  ),
                ),
              ],
            ),
          ),
        ), 
    );
  }
}