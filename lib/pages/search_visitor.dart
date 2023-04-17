import 'package:contractor_mobile_applicatin/Home_pages/visitor_home.dart';
import 'package:flutter/material.dart';

class SearchVisitorPage extends StatelessWidget {
  final Function()? onTap;
  const SearchVisitorPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        leading: const BackButton(),
        centerTitle: true,
        title: const Text('Find Contractor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 55,
              padding: const EdgeInsets.only(
                right: 8,
                left: 16,
                bottom: 4,
                top: 6,
              ), // EdgeInsets.only
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey[200],
              ), // BoxDecoration
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.black),
                cursorHeight: 24,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 24,
                  ),
                  hintText: 'Search For Contractor',
                  focusColor: Colors.greenAccent,
                  contentPadding: EdgeInsets.only(bottom: 5),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
