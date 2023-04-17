import 'package:flutter/material.dart';

class ListOfAppointment extends StatelessWidget {
  const ListOfAppointment({Key? key, required Null Function() onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: const BackButton(),
        centerTitle: true,
        title: const Text('List Of Appointments'),
      ),
    );
  }
}
