import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'package:flash_char_flutter/constants.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFiledInputDecoration.copyWith(
                  hintText: 'Enter a email id'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFiledInputDecoration.copyWith(
                  hintText: 'Enter a password'),
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            CustomButton(
                title: 'Log In',
                onPressed: () {},
                colour: Colors.lightBlueAccent),
          ],
        ),
      ),
    );
  }
}
