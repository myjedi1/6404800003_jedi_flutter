import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/pages/productPage.dart';

class productStack extends StatefulWidget {
  const productStack({super.key});

  @override
  State<productStack> createState() => _productStackState();
}

class _productStackState extends State<productStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'productstack/product',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'productstack/product' :
            builder = (BuildContext context) => const productPage();
            break;
          
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}