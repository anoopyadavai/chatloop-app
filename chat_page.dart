import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  final String username;

  ChatPage({required this.username});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController messageController = TextEditingController();

  List<String> messages = [];

  void sendMessage() {
    String msg = messageController.text.trim();

    if(msg.isNotEmpty){
      setState(() {
        messages.add("${widget.username}: $msg");
      });

      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("ChatLoop"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: