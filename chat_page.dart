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
        messages.add(msg);
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
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );

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
              itemCount: messages.length,
              itemBuilder: (context,index){
                return Align(
                  alignment: Alignment.centerRight,
                  child: messageBubble(messages[index]),
                );
              },
            ),
          ),

          Row(
            children: [

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendMessage,
              )

            ],
          )

        ],
      ),
    );
  }
}