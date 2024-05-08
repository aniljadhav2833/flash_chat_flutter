import 'package:flutter/material.dart';
import 'package:flash_char_flutter/constants.dart';
import 'custom_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              keyboardType: TextInputType.emailAddress,
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
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 24.0,
            ),
            CustomButton(
                title: 'Register', onPressed: () {}, colour: Colors.blueAccent)
          ],
        ),
      ),
    );
  }
}
