import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:Jedi_phatsarat_6404800003/widget/menu.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../widget/menu.dart';

class footballPage extends StatefulWidget {
  const footballPage({super.key});

  @override
  State<footballPage> createState() => _footballPageState();
}

class _footballPageState extends State<footballPage> {
  List<dynamic>? teamData = [];
  bool isLoading = true;
  Future<void> getData() async {
    var url = Uri.parse('https://noraphat.dev/web_api/get_team_name/');
    var response = await http.get(url);
    Map<String , dynamic>? data;
    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
      // print(response.body);
      // final Product product =
      //     Product.fromJson(convert.jsonDecode(response.body));
      setState(() {
        teamData!.addAll(data!['TeamName']);
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
        title: Text('Football team'),
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
                            image: NetworkImage(teamData![index]['team_logo']),
                            fit: BoxFit.cover)),
                  ),
                  title: Text('${teamData![index]['team_name']}'),
                  subtitle: Text('${teamData![index]['id']}team_id'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                  Navigator.pushNamed(context, 'homestack/footBallMaps', arguments: {
                    'lat': double.parse(teamData![index]['team_lat']),
                    'lng': double.parse(teamData![index]['team_long'])
                  });
                },
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(),
              itemCount: teamData!.length,),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
