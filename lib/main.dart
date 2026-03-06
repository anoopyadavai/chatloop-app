import 'package:flutter/material.dart';

void main() {
  runApp(ChatLoop());
}

class ChatLoop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatLoop',
      home: Scaffold(
        appBar: AppBar(
          title: Text("ChatLoop"),
        ),
        body: Center(
          child: Text("Welcome to ChatLoop"),
        ),
      ),
    );
  }
}