import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/football.dart';
import 'package:Jedi_phatsarat_6404800003/pages/footballMap.dart';
import 'package:Jedi_phatsarat_6404800003/pages/newsPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/webViewPage.dart';

class footballStack extends StatefulWidget {
  const footballStack({super.key});

  @override
  State<footballStack> createState() => _footballStackState();
}

class _footballStackState extends State<footballStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'footballStack/footballPage',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'footballStack/footballPage' :
            builder = (BuildContext context) => const footballPage();
            break;
          case 'footballStack/footBallMaps' :
            builder = (BuildContext context) => const footballMap();
            break;
          
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}