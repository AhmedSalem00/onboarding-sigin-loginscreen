import 'package:flutter/material.dart';
import 'package:task1/modules/components/button.dart';
import 'package:task1/modules/login/login_screen.dart';


class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0.0, actions: [
        TextButton(
          child: Text(
            'Skip',
          ),
          onPressed: () {
            navigateTo(context, LoginScreen());
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Image.asset(
              'assets/images/on_board.png',
            ),
            ButtonKey(
              background: Colors.teal,
              text: 'Get Started',
              function: () => navigateTo(context, LoginScreen()),
              textColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
