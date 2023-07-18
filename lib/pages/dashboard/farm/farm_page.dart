import 'package:first_app/pages/dashboard/farm/hard_widget.dart';
import 'package:flutter/material.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('𝔽 𝔸 ℝ 𝕄'),
        backgroundColor: const Color(0xff433831),
      ),
      body: const Row(
        children: [
          HardWidget(
              name: 'Farm A',
              imagePath: 'images/icons/field.png',
              text: 'Farm A Site'),
        ],
      ),
    );
  }
}
