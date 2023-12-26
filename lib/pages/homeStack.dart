import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/companyPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/contactPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/aboutPage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/football.dart';
import 'package:Jedi_phatsarat_6404800003/pages/footballMap.dart';
import 'package:Jedi_phatsarat_6404800003/pages/homepage.dart';
import 'package:Jedi_phatsarat_6404800003/pages/maps.dart';
import 'package:Jedi_phatsarat_6404800003/pages/picturePage.dart';

import 'cameraPage.dart';

class homeStack extends StatefulWidget {
  const homeStack({super.key});

  @override
  State<homeStack> createState() => _homeStackState();
}

class _homeStackState extends State<homeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            builder = (BuildContext context) => const homepage();
            break;
          case 'homestack/football':
            builder = (BuildContext context) => const footballPage();
            break;
          case 'homestack/footBallMaps':
            builder = (BuildContext context) => const footballMap();
            break;
          case 'homestack/about':
            builder = (BuildContext context) => const aboutPage();
            break;
          case 'homestack/contact':
            builder = (BuildContext context) => const contactPage();
            break;
          case 'homestack/company':
            builder = (BuildContext context) => const companyPage();
            break;
          case 'homestack/camera':
            builder = (BuildContext context) => const CameraPage();
            break;
          case 'homestack/picture':
            builder = (BuildContext context) => const PicturePage();
            break;
          case 'homestack/mappage':
            builder = (BuildContext context) => const mapsPage();
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}