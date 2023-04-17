import 'package:contractor_mobile_applicatin/Home_pages/staff_home.dart';
import 'package:flutter/material.dart';
import '../component /my_button.dart';
import '../component /my_textfield.dart';

class Appointment extends StatefulWidget {
  final Function()? onTap;
  Appointment({super.key, required this.onTap});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: const BackButton(),
        centerTitle: true,
        title: const Text('Appointment Page'),
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Set Appointment ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(height: 40),
                // email textfield
                TextFormField(
                  controller: nameController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2_rounded),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      color: Color(0xFF777BEC),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                TextFormField(
                  controller: emailController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xFF777BEC),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                TextFormField(
                  controller: companyController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.business_center),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Company Name',
                    labelStyle: TextStyle(
                      color: Color(0xFF777BEC),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),

                // email textfield
                const SizedBox(height: 9),
                TextFormField(
                  controller: dateController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.date_range_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Date',
                    labelStyle: TextStyle(
                      color: Color(0xFF777BEC),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),

                const SizedBox(height: 9),
                // password textfeild
                TextFormField(
                  controller: timeController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.access_time_filled_sharp),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Time',
                    labelStyle: TextStyle(
                      color: Color(0xFF777BEC),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),
                //Confirm  password textfeild
                const SizedBox(height: 9),
                TextFormField(
                  controller: reasonController,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.question_mark_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Reason',
                    labelStyle: TextStyle(
                      color: Color(0xFF777BEC),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),
                const SizedBox(height: 150),

                // MyTextField(
                //   controller: reasonController,
                //   hintText: "Reason of coming",
                //   obscureText: true,
                // ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 5,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Send',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
