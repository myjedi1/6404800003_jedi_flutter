import 'package:flutter/material.dart';

class footer extends StatefulWidget {
  const footer({super.key});

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  String footerName = "Jedi";

  void changeFooterName(){
    setState(() {
      footerName = "Hello world";
    });
  }
  
  @override
  void initState(){
    super.initState();
    print("init footer");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Hi $footerName"),
        ElevatedButton(
          onPressed: changeFooterName,
          child:Text("Try me")
        ),

      ],
    );
  }
  
}