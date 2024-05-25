import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_char_flutter/screens/chat_screen.dart';
import 'package:flash_char_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});
  static const id = 'wrapper_screen';

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChatScreen();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
