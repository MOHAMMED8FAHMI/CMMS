import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contractor_mobile_applicatin/component%20/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../component /my_button.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final dref = FirebaseDatabase.instance.reference();

  late DatabaseReference databaseReference;
  // text editing controllers
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final roleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    companyController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // sign user up method
  Future signUserUp() async {
    // find what future dose when replace it with void
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        // show error massage
        showErrorMassage("Password dose not match");
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      showErrorMassage(e.code);

      addUserDetails(
        nameController.text.trim(),
        emailController.text.trim(),
        int.parse(ageController.text.trim()),
        companyController.text.trim(),
        roleController.text.trim(),
      );
    }
  }

  Future addUserDetails(String fullName, String email, int age,
      String companyName, String role) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name ': fullName,
      'email': email,
      'age': age,
      'company name': null,
      'role': role,
    });
  }

  void showErrorMassage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // void wrongPasswordMassage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.lightBlue,
  //         title: Text('Incorrect Email '),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                Image.asset(
                  'assets/Kaneka_logo.png',
                  height: 22,
                ),
                const SizedBox(height: 10),

                const Text(
                  'Registration Page ',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 15),
                imageProfile(),
                const SizedBox(height: 15),
                // email textfield
                MyTextField(
                  controller: nameController,
                  hintText: "Full Name",
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: ageController,
                  hintText: "Age",
                  obscureText: false,
                ),
                // email textfield
                const SizedBox(height: 5),

                MyTextField(
                  controller: companyController,
                  hintText: "Company",
                  obscureText: false,
                ),
                const SizedBox(height: 5),

                const SizedBox(height: 5),
                // password textfeild
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                //Confirm  password textfeild
                const SizedBox(height: 5),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),

                const SizedBox(height: 50),

                // sign in button
                MyButton(
                  text: ('sing up '),
                  onTap: signUserUp,
                ),

                const SizedBox(height: 10),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Stack(children: const <Widget>[
      CircleAvatar(
        radius: 60.0,
        backgroundImage: AssetImage('assets/Profile.png'),
      ),
      Positioned(
        bottom: 6.0,
        right: 10.0,
        child: InkWell(
          child: Icon(
            Icons.camera_alt,
            color: Colors.black,
            size: 28.0,
          ),
        ),
      )
    ]);
  }
}
