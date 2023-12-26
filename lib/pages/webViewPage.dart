import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewPage extends StatefulWidget {
  const webViewPage({super.key});

  @override
  State<webViewPage> createState() => _webViewPageState();
}

class _webViewPageState extends State<webViewPage> {
  @override
  Widget build(BuildContext context) {
    Map<String , dynamic> news = ModalRoute.of(context)?.settings.arguments as Map<String , dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text('${news['name']}'),
      ),
      body: WebView(
        initialUrl: '${news['url']}',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}