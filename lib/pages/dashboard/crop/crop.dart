import 'package:flutter/material.dart';

class CropPage extends StatefulWidget {
  const CropPage({super.key});

  @override
  State<CropPage> createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ℂ ℝ 𝕆 ℙ'),
        backgroundColor: const Color(0xff433831),
      ),
      body: const Center(
        child: Text('Crop Page'),
      ),
    );
  }
}
