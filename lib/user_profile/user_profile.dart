import 'package:contractor_mobile_applicatin/generated/assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contractor_mobile_applicatin/user_profile/edit_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  // const UserProfile({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  bool isObscurePassword = true;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  //
  // CollectionReference usersRef = firestore.collection('users');
  //
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  // usersRef.get().then((QuerySnapshot snapshot) {
  // snapshot.docs.forEach((DocumentSnapshot document) {
  // print(document.data());
  // });
  // });

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white70,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            // <-- SEE HERE
          ),
          leading: const BackButton(),
          centerTitle: true,
          title: const Text('Profile Page'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                builderTextField("Full name", "Demon", false),
                builderTextField("Email", "mohammed@gmail.comn", false),
                builderTextField("Company", "Kaneka", false),
                builderTextField("Password", "*******", false),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EditUserProfile();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}

Widget builderTextField(
    String labelTex, String placeholder, bool isPasswordTextField) {
  bool isObscurePassword = true;
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: isPasswordTextField ? isObscurePassword : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  // setState(() {
                  //   isObscurePassword = !isObscurePassword;
                  // });
                })
            : null,
        contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelTex,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

//
