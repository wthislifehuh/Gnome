import 'dart:io';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_app/pages/doctor/pages/result_page.dart';
import 'package:first_app/pages/doctor/services/http.dart';
import 'package:first_app/pages/doctor/widgets/button.dart';

class ImagePreview extends StatefulWidget {
  final String imagePath;

  const ImagePreview({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Preview your image",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColors.darkBrown,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Image.file(File(widget.imagePath),
                    height: 300, fit: BoxFit.cover),
                const Spacer(
                  flex: 1,
                ),
                Button(
                  title: "Send",
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    var result = await sendToPredictor(widget.imagePath);
                    final String plant = result['plant'];
                    final String disease = result['disease'];
                    final String remedy = result['remedy'];
                    print(result);
                    setState(() {
                      isLoading = false;
                    });
                    Get.to(() => ResultPage(
                          disease: disease,
                          plant: plant,
                          remedy: remedy,
                        ));
                  },
                ),
                isLoading
                    ? const Expanded(
                        flex: 2,
                        child: Center(child: CircularProgressIndicator()))
                    : const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
