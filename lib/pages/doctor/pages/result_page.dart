import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:first_app/pages/doctor/pdf_gen.dart';
import 'package:first_app/pages/doctor/services/http.dart';
import 'package:first_app/pages/doctor/widgets/button.dart';

class ResultPage extends StatefulWidget {
  final String disease, plant, remedy;

  const ResultPage(
      {Key? key,
      required this.disease,
      required this.plant,
      required this.remedy})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBr,
      appBar: AppBar(
          title: const Text(
            "Your 𝔾 ℕ 𝕆 𝕄 𝔼 Crop Analysis Report",
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
          ),
          backgroundColor: AppColors.darkBrown),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 300,
              width: 350,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.darkBr.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  const Text("Plant Name:",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      )),
                  Text(widget.plant,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  widget.disease == "healthy"
                      ? const Text("Your Plant is Healthy!!",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ))
                      : Column(
                          children: [
                            const Text("Disease detected:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                )),
                            Text(widget.disease,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                  const Spacer(flex: 1),
                  widget.disease == "healthy"
                      ? Container()
                      : const Text("Possible remedy: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          )),
                  const SizedBox(height: 2),
                  widget.disease == "healthy"
                      ? Container()
                      : Text(widget.remedy,
                          style: const TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Poppins',
                          )),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
                title: "Send Alert",
                onTap: () async {
                  await sendAlerts(
                      plant: widget.plant, disease: widget.disease);
                  Get.snackbar(
                    "Success!",
                    "The Alert has been sent to everyone",
                    backgroundColor: Colors.white,
                    duration: const Duration(seconds: 8),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Button(
                title: "Make Report",
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  bool result = await makeReport(
                    plant: widget.plant,
                    disease: widget.disease,
                    remedy: widget.remedy,
                  );
                  setState(() {
                    isLoading = false;
                  });
                  print(result);

                  // if (result) {
                  //   Get.snackbar(
                  //     "Success!",
                  //     "The Crop Analysis Report has been generated and saved to Downloads folder",
                  //     backgroundColor: Colors.white,
                  //     duration: Duration(seconds: 16),
                  //   );
                  // }
                }),
            isLoading
                ? const Expanded(
                    flex: 1, child: Center(child: CircularProgressIndicator()))
                : const Spacer(
                    flex: 1,
                  )
          ],
        ),
      ),
    );
  }
}
