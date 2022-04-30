// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:killa/pages/HelpPages/firstHelpPage.dart';

class secondHelpPage extends StatefulWidget {
  const secondHelpPage({Key? key}) : super(key: key);

  @override
  _secondHelpPageState createState() => _secondHelpPageState();
}

class _secondHelpPageState extends State<secondHelpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: const [],
          onPageChanged: (value) {
            setState(() {
            });
          },
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.to(() => const firstHelpPage());
              },
              icon: const Icon(Icons.arrow_left),
            ),
            const Text(
              "2/7",
            ),
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.arrow_right),
            )
          ],
        ));
  }
}

