import 'package:chat_gpt_app/ui/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
