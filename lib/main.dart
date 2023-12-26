import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/contactPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/aboutPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/footballStack.dart';
import 'package:Jedi_phatsarat_6404800003/pages/homeStack.dart';
import 'package:Jedi_phatsarat_6404800003/pages/homepage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/loginPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/newsStack.dart';
import 'package:Jedi_phatsarat_6404800003/pages/productStack.dart';
import 'package:Jedi_phatsarat_6404800003/widget/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jedi_Phatsarat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/homestack',
      routes: {
        '/':(context) => loginPage(),
        '/homestack':(context) => homeStack(),
        '/productstack':(context) => productStack(),
        '/newsStack':(context) => newsStack(),
        '/footballStack':(context) => footballStack()
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Image.asset('assets/images/sea.jpg',
              width: 320,
              height: 460,
              fit: BoxFit.cover,),
              Image.network('https://tonkit360.com/wp-content/uploads/2019/09/IMG_4217.jpg'),
              footer(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('assets/images/sea.jpg',
                    width: 128,
                    height: 128,
                    fit: BoxFit.cover,),
                    Image.network('https://tonkit360.com/wp-content/uploads/2019/09/IMG_4217.jpg')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
