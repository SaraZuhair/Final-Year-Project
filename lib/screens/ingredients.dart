import 'package:flutter/material.dart';

class Ingredients extends StatefulWidget {
  Map food;
   Ingredients({ Key? key, required this.food }) : super(key: key);

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(height: 500,
      width: double.infinity,
      child: Column(children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            itemCount: widget.food['ingredients'].length,
            itemBuilder: (context, index) {
            return Card(
              child: ListTile(
              title: Text(widget.food['ingredients'][index]) ,
              ),
            );
            
          },),),


        
      ],),
      ),
      
    );
  }
}