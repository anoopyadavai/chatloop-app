import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(ChatLoopApp());
}

class ChatLoopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatLoop',
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}