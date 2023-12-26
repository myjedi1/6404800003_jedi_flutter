import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:Jedi_phatsarat_6404800003/widget/menu.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../widget/menu.dart';

class productPage extends StatefulWidget {
  const productPage({super.key});

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  List<Course>? course = [];
  bool isLoading = true;
  Future<void> getData() async {
    var url = Uri.parse('https://noraphat.dev/ComSciSiamU/phatsarat_jedi/web_api/get_product/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      final Product product =
          Product.fromJson(convert.jsonDecode(response.body));
      setState(() {
        course = product.course;
        isLoading = false;
      });
    } else {
      print('Error status code = ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Product'),
      ),
      endDrawer: menu(),
      body: isLoading == true
          ? Center(
            child: CircularProgressIndicator(),
          )
          : ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(course![index].images!),
                            fit: BoxFit.cover)),
                  ),
                  title: Text('${course![index].pdName}'),
                  subtitle: Text('${course![index].price} THB.-'),
                  trailing: Icon(Icons.arrow_right),
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(),
              itemCount: course!.length),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
