import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('𝔽 𝔸 𝕍 𝕆 𝕌 ℝ 𝕀 𝕋 𝔼'),
          backgroundColor: const Color(0xff433831),
        ),
        backgroundColor: const Color(0xffF8F7F4),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Favourite Page'),
            ],
          ),
        ));
  }
}
