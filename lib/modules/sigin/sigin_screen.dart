import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task1/modules/login/login_screen.dart';
import 'package:task1/shared/components/button.dart';

class SigninScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var PhoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            (Icons.arrow_back),
            color: Colors.grey,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Create an account it\'s free',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Help',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.help),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Email must be not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Eg.example@gmail.com',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Password must be not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonKey(
                    text: 'Register',
                    background: Colors.teal,
                    textColor: Colors.white,
                    function: () {
                      if (formKey.currentState!.validate())
                        print(emailController.text);
                      print(passwordController.text);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Or',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,

                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.teal,
                        size: 20.0,
                      ),
                      label: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Has any account?',
                        style: TextStyle(color: Colors.teal),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                        },
                        child: Text(
                          'Sign in here',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
