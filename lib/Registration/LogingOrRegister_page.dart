import 'package:contractor_mobile_applicatin/Registration/login.dart';
import 'package:contractor_mobile_applicatin/Registration/registration_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegistrationPage extends StatefulWidget {
  const LoginOrRegistrationPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegistrationPage> createState() =>
      _LoginOrRegistrationPageState();
}

class _LoginOrRegistrationPageState extends State<LoginOrRegistrationPage> {
  //inisitally show the login page
  bool showLoginPage = true;
  //toggle between login and register page

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePage,
      );
    } else {
      return RegisterPage(onTap: togglePage);
    }
  }
}
