import 'package:flash_char_flutter/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_char_flutter/constants.dart';
import 'custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //final auth = FirebaseAuth.instance;
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
  void initState() {
    // TODO: implement initState
    super.initState();
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
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: password,
                decoration: kTextFiledInputDecoration.copyWith(
                    hintText: 'Enter a password'),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 24.0,
              ),
              CustomButton(
                  title: 'Register',
                  onPressed: () async {
                    setState(() {
                      isShow = true;
                    });
                    try {
                      var user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
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
                    }
                  },
                  colour: Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }
}
