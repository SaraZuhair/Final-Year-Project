import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({ Key? key }) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("loggedin")),
      ),
      body: Center(child: Text("LOGGED IN")),
    );
  }
}