import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final void Function()? onTap; // Add 'final' keyword

  const LikeButton({Key? key, required this.isLiked, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.pink : AppColors.brown,
        size: 30,
      ),
    );
  }
}
