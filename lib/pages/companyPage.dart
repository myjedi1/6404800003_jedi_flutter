import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/footerRow.dart';

class companyPage extends StatefulWidget {
  const companyPage({super.key});

  @override
  State<companyPage> createState() => _companyPageState();
}

class _companyPageState extends State<companyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company page'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/space.jpg'),
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phatsarat",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: Colors.pinkAccent,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [Text("Jedi")],
                          ),
                          Row(
                            children: [Text("0942419788")],
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Wrap(
                      spacing: 8,
                      children: List.generate(
                        4,
                        (index) => const Chip(
                          label: Text("label"),
                          avatar: Icon(Icons.star),
                          backgroundColor: Colors.orangeAccent,
                        ),
                      )),
                  Divider(),
                  footerRow(),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }


}
