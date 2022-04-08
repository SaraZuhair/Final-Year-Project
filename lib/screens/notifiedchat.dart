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
        title:const Text("miracle if i ever did it"),
         ),
    );
  }
}