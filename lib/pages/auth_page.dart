import 'package:contractor_mobile_applicatin/Registration/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../Registration/LogingOrRegister_page.dart';
import '../Home_pages/staff_home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Staff_HomePage();
          } else {
            return LoginOrRegistrationPage();
          }
        },
      ),
    );
  }
}
