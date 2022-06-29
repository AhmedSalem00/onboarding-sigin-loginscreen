import 'package:flutter/material.dart';
import 'package:task1/login/components/button.dart';
import 'package:task1/login/components/components.dart';
import 'package:task1/login/login/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardScreen extends StatefulWidget {
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/on_board.png',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/images/on_board.png',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/images/on_board.png',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];
}

class _OnBoardScreenState extends State<OnBoardScreen> {
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
