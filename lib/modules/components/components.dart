import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {
  final double width;
  final Color ButtonColor;
  final Function function;
  final String text;
  final bool isUpperCase;

  const defaultButton({
    Key? key,
    this.width = double.infinity,
    required this.function,
    required this.text,
    this.ButtonColor = Colors.teal,
    this.isUpperCase = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: ButtonColor,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget defaultFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  Function(String?)? onSubmit,
  Function? onChange(String)?,
  Function? onTap()?,
  bool isPassword = false,
  String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixpressed,
  bool isClickable = true, //If you want to just click on it
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed!(),
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
