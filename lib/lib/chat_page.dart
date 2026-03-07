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

  Map<String, List<String>> loopMessages = {
    "General": [],
    "Study": [],
    "Memes": []
  };

  void sendMessage() {
    String msg = messageController.text.trim();
    if (msg.isNotEmpty) {
      setState(() {
        loopMessages[currentLoop]!.add(msg);
      });
      messageController.clear();
    }
  }

  Widget messageBubble(String message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
          SizedBox(height: 10),
          DropdownButton<String>(
            value: currentLoop,
            items: loopMessages.keys.map((loop) {
              return DropdownMenuItem(
                value: loop,
                child: Text(loop),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                currentLoop = value!;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: loopMessages[currentLoop]!.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: messageBubble(loopMessages[currentLoop]![index]),
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