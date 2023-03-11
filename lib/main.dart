import '/ui/providers/chat_provider.dart';
import '/ui/providers/models_provider.dart';
import 'data/constants/constants.dart';
import 'ui/view/screens/chat_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ModelsProvider>(create: (_) => ModelsProvider()),
        ListenableProvider<ChatProvider>(create: (_) => ChatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat With GPT-3',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: scaffoldBgColor,
        appBarTheme: AppBarTheme(color: cardColor),
      ),
      home: const ChatScreen(),
    );
  }
}
