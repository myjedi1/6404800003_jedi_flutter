import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/widget/menu.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('hi flutter app'),
        ),
        endDrawer: menu(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/space.jpg")
            ,fit: BoxFit.fill),
          ),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/company');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[100],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Company"),
                      Icon(
                        Icons.business,
                        size: 80,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/mappage');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[100],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Google maps"),
                      Icon(
                        Icons.map,
                        size: 80,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/camera');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[100],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Camera"),
                      Icon(
                        Icons.camera_enhance,
                        size: 80,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/about', arguments: {
                    'email': 'jedi01@gmail.com',
                    'telnum': '0942419788'
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[100],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "About me",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/football');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.red[100],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Football Team",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.sports_soccer,
                          size: 80,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
