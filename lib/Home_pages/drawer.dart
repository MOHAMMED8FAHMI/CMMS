import 'package:contractor_mobile_applicatin/pages/search_visitor.dart';
import 'package:contractor_mobile_applicatin/user_profile/edit_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'staff_home.dart';
import '../Appointment/Appointment.dart';
import '../user_profile/user_profile.dart';
import '../Appointment/list_of_appointment.dart';

class drawer extends StatelessWidget {
  final String title;

  void singOut() {
    FirebaseAuth.instance.signOut();
  }

  const drawer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: singOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(child: Text(' Staff_HomePage')),
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
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Staff_HomePage(),
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
            ListTile(
              leading: const Icon(
                Icons.list,
                color: Colors.blue,
              ),
              title: const Text('List of Appointment'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ListOfAppointment(
                  onTap: () {},
                ),
              )),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_sharp,
                color: Colors.blue,
              ),
              title: const Text('Find Visitor'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchVisitorPage(
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
