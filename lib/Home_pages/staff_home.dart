import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class Staff_HomePage extends StatelessWidget {
  final appTitle = 'CMMS'; // add title for the Staff_HomePage

  const Staff_HomePage({super.key});

  void singOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: drawer(title: appTitle),
      ),
    );
  }
}
