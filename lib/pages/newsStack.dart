import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/newsPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/webViewPage.dart';

class newsStack extends StatefulWidget {
  const newsStack({super.key});

  @override
  State<newsStack> createState() => _newsStackState();
}

class _newsStackState extends State<newsStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'newsStack/news',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'newsStack/news' :
            builder = (BuildContext context) => const newsPage();
            break;
          case 'newsStack/webview' :
            builder = (BuildContext context) => const webViewPage();
            break;
          
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}