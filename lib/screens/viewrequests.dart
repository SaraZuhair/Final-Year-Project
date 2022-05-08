import 'package:flutter/material.dart';

class ViewRequests extends StatefulWidget {
  const ViewRequests({ Key? key }) : super(key: key);

  @override
  State<ViewRequests> createState() => _ViewRequestsState();
}

class _ViewRequestsState extends State<ViewRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("view"),
      ),
      
    );
  }
}