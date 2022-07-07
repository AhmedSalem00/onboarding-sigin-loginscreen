import 'package:flutter/material.dart';


class ButtonKey extends StatelessWidget {
  final String text;
  final Function() function;
  final Color textColor;
  final Color background;
  const ButtonKey({
    Key? key,
    required this.text,
    required this.function,
    required this.textColor,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: MaterialButton(
        height: 50.0,
        color: Colors.teal,
        textColor: Colors.white,
        onPressed: function,
        child: Text(
          text,

        ),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      //How do I link two pages?
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );




