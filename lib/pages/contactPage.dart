import 'package:flutter/material.dart';

class contactPage extends StatefulWidget {
  const contactPage({super.key});

  @override
  State<contactPage> createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jedi\'s Contact page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Text('Page 2'),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, 'homestack/home', (route) => false);
            }, child: Text("Homepage"))
          ],
        ),
      ),
    );
  }
}