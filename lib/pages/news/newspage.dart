import 'package:first_app/pages/news/views/categorytile.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/news/helper/data.dart';
import 'package:first_app/pages/news/views/newstile.dart';

import 'package:first_app/pages/news/models/categorie_model.dart';
import 'helper/getnews.dart';

class NewsPage extends StatefulWidget {
  @override
  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool _loading = false;
  var newslist = [];

  List<CategorieModel> categories = [];

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBr,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 40,
            ),
            Text(
              "𝔾 ℕ 𝕆 𝕄 𝔼   ℕ 𝔼 𝕎 𝕊",
              style: TextStyle(
                  color: AppColors.lightBrown, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        backgroundColor: AppColors.darkBrown,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                widthFactor: double.maxFinite,
                heightFactor: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/GNOME_Logo.png',
                      height: 150,
                      width: 150,
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    /// Categories
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageAssetUrl: categories[index].imageAssetUrl,
                              categoryName: categories[index].categorieName,
                            );
                          }),
                    ),

                    /// News Article
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                          itemCount: newslist.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newslist[index].urlToImage ?? "",
                              title: newslist[index].title ?? "",
                              desc: newslist[index].description ?? "",
                              content: newslist[index].content ?? "",
                              posturl: newslist[index].articleUrl ?? "",
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
