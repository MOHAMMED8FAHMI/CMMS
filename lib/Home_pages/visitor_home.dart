import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contractor_mobile_applicatin/Appointment/Appointment.dart';
import 'package:contractor_mobile_applicatin/user_profile/edit_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../user_profile/user_profile.dart';

class Visitor_HomePage extends StatelessWidget {
  final appTitle = 'CMMS';

  const Visitor_HomePage({super.key});
  void singOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          body: drawer(title: appTitle),
        ));
  }
}

class drawer extends StatelessWidget {
  drawer({Key? key, required this.title}) : super(key: key);
  final String title;

  void singOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: singOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text(' Visitor Homepage'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'K A N E K A  ',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: const Text('My Profile'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserProfile(),
              )),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: const Text('Home Page'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Visitor_HomePage(),
              )),
            ),
            ListTile(
              leading: const Icon(
                Icons.book,
                color: Colors.blue,
              ),
              title: const Text('Appointment'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Appointment(
                  onTap: () {},
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
