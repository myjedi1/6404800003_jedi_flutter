import 'package:flutter/material.dart';
import 'package:Jedi_phatsarat_6404800003/widget/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class newsPage extends StatefulWidget {
  const newsPage({super.key});

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  List<dynamic>? article = [];
  int totalResult = 0;
  bool isLoading = true;
  int page = 1;
  int pageSize = 4;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<void> getData() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=0d8e6a59d0484a92849cbb47dd48ffe7&page=$page&pageSize=$pageSize');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // print(response.body);
        final Map<String, dynamic> news = convert.jsonDecode(response.body);
        print('total result = ${news['totalResults']}');
        setState(() {
          totalResult = news['totalResults'];
          article!.addAll(news['articles']);
          isLoading = false;
        });
      } else {
        print('Error status code = ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    setState(() {
      article!.clear();
      page = 1;
    });

    getData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    if (mounted) {
      setState(() {
        page = ++page;
      });
    }
    getData();
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: menu(),
        appBar: AppBar(
          title: totalResult > 0 ? Text('News $totalResult topics') : null,
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: ClassicHeader(
                  refreshStyle: RefreshStyle.Follow,
                  refreshingText: 'Now Loading',
                  completeText: 'Success Loading',
                ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("release to load more");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'newsStack/webview',
                                arguments: {
                                  'url': article![index]['url'],
                                  'name': article![index]['source']['name'],
                                  'title': article![index]['title']
                                });
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: article![index]['urlToImage'] !=
                                                null
                                            ? Ink.image(
                                                image: NetworkImage(
                                                    article![index]
                                                        ['urlToImage']),
                                                fit: BoxFit.cover)
                                            : Ink.image(
                                                image: NetworkImage(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1200px-No_image_3x4.svg.png'),
                                                fit: BoxFit.cover),
                                      ),
                                      Positioned(
                                          top: 16,
                                          bottom: 16,
                                          left: 16,
                                          right: 16,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              article![index]['source']['name'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(article![index]['title']),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            article![index]['author'] != null
                                                ? Chip(
                                                    avatar:
                                                        Icon(Icons.person_pin),
                                                    label: article![index]
                                                                    ['author']
                                                                .length <
                                                            20
                                                        ? Text(article![index]
                                                            ['author'])
                                                        : Text(article![index]
                                                                ['author']
                                                            .substring(0, 20)),
                                                  )
                                                : Text(''),
                                            Text(DateFormat.yMMMEd()
                                                .add_Hms()
                                                .format(DateTime.parse(
                                                    article![index]
                                                        ['publishedAt'])))
                                          ])
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) =>
                        Divider(),
                    itemCount: article!.length),
              ));
  }
}
