import 'package:final_year_project/providers/recipes.dart';
import 'package:final_year_project/providers/theme.dart';
import 'package:final_year_project/screens/ingredients.dart';
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
    print("o,imnuiby");
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
        
       bottom:  PreferredSize(
         preferredSize: const Size.fromHeight(48.0),
         child: Column(
         
           children: const [
                Text("Whats on your mind today", 
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



         body: 
        SizedBox(
          width: double.infinity,
          height: 550,
          child: SingleChildScrollView(
            child: Column(
              children: [
          
                Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: TextField(
                    
                    
                    onChanged: (value)async {
                  
                     await recipe.searchrecipe(value).then((value) {
                       setState(() {
                         
                       });
                       
                     });                 
                    },
                  ),
                ),
                SizedBox(height: 100,),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: recipe.suggest.length==0? GridView.builder(
                  
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
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                           color: Colors.amber,
                           child: Column(
                             children: [
                               Image.network("https://www.simplyrecipes.com/thmb/8caxM88NgxZjz-T2aeRW3xjhzBg=/2000x1125/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-8f256746d649404baa36a44d271329bc.jpg"),
                              Text(recipe.food[index]['name']),
                             ],
                           ),
                                     
                         ),
                       );
                     }, 
                  
                    
                    ) : GridView.builder(
                  
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: recipe.suggest.length,
                    
                     itemBuilder: (BuildContext context, int index) { 
                        
                       return InkWell(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(
                             builder: (_)=> Ingredients(food: recipe.suggest[index]),)
                             );
                         },

                         child: Card(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                           color: Colors.amber,
                           child: Column(
                             children: [
                               Image.network("https://www.simplyrecipes.com/thmb/8caxM88NgxZjz-T2aeRW3xjhzBg=/2000x1125/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-8f256746d649404baa36a44d271329bc.jpg"),
                              Text(recipe.suggest[index]['name']),
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