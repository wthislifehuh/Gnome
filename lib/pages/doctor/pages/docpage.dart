import 'package:first_app/pages/doctor/pages/camera_page.dart';
import 'package:first_app/pages/doctor/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocPage extends StatefulWidget {
  const DocPage({super.key});

  @override
  State<DocPage> createState() => _DocPageState();
}

class _DocPageState extends State<DocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('𝔾 ℕ 𝕆 𝕄 𝔼   𝔻 𝕆 ℂ'),
        backgroundColor: const Color(0xff433831),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/icons/sprout.png', width: 100, height: 100),
            Button(
                title: "Scan Crop",
                onTap: () => Get.to(() => const CameraPage())),
          ],
        ),
      ),
    );
  }
}
