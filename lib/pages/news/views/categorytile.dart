import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/pages/news/views/categorie_news.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? imageAssetUrl, categoryName;

  const CategoryCard({
    super.key,
    required this.imageAssetUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName!.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl!,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black26),
              child: Text(
                categoryName!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    fontFamily: 'Poppins'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
