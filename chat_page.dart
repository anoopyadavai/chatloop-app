import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  final String username;

  ChatPage({required this.username});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController messageController = TextEditingController();

  String currentLoop = "General";

  Map<String,List<String>> loopMessages = {
    "General": [],
    "Study": [],
    "Memes": []
  };

  void sendMessage(){

    String msg = messageController.text.trim();

    if(msg.isNotEmpty){

      setState(() {

        loopMessages[currentLoop]!.add(msg);

      });

      messageController.clear();
    }
  }

  Widget messageBubble(String message){

    return Container(
      margin: EdgeInsets.symmetric(vertical:5,horizontal:10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),