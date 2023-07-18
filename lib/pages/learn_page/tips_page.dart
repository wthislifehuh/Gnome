import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('𝕋 𝕀 ℙ 𝕊',
              style:
                  TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold)),
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
              Text('Tips Page'),
            ],
          ),
        ));
  }
}
