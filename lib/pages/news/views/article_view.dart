import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArticleView extends StatefulWidget {
  final String postUrl;
  const ArticleView({
    Key? key,
    required this.postUrl,
  }) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
  //_ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "𝔾 ℕ 𝕆 𝕄 𝔼  ℕ 𝔼 𝕎 𝕊 ",
              style: TextStyle(
                  color: AppColors.lightBrown, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.darkBrown,
        elevation: 0.0,
      ),
      // body: const Center(
      //   child: Text("Hello World", style: TextStyle(color: Colors.black)),
      // ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.postUrl)),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ),
    );
  }
}
