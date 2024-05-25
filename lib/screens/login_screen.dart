import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'package:flash_char_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_char_flutter/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShow = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isShow,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 190.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: email,
                decoration: kTextFiledInputDecoration.copyWith(
                    hintText: 'Enter a email id'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: password,
                decoration: kTextFiledInputDecoration.copyWith(
                    hintText: 'Enter a password'),
                obscureText: true,
              ),
              SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  title: 'Log In',
                  onPressed: () async {
                    setState(() {
                      isShow = true;
                    });
                    try {
                      var user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        isShow = false;
                      });
                      email.clear();
                      password.clear();
                    } catch (e) {
                      print(e);
                      setState(() {
                        isShow = false;
                        password.clear();
                      });
                    }
                  },
                  colour: Colors.lightBlueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
