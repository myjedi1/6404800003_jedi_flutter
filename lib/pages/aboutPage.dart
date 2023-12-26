import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/widget/menu.dart';

class aboutPage extends StatefulWidget {
  const aboutPage({super.key});

  @override
  State<aboutPage> createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> company =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('About Jedi'),
      ),
      endDrawer: menu(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Hi Jedi!"),
            Text('Email ${company['email']}'),
            Container(
              child: SingleChildScrollView(
                child: Text('Page 2'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'homestack/contact');
                },
                child: Text("contactPage")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Homepage"))
          ],
        ),
      ),
    );
  }
}
