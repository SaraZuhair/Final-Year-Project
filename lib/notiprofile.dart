import 'package:flutter/material.dart';


class Notifiedprofile extends StatefulWidget {
  const Notifiedprofile({ Key? key }) : super(key: key);

  @override
  State<Notifiedprofile> createState() => _NotifiedprofileState();
}

class _NotifiedprofileState extends State<Notifiedprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notified user"),
      ),
    );
  }
}