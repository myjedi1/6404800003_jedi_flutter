import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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