import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:logging/logging.dart';

Future<Uint8List> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return File('${(await getTemporaryDirectory()).path}/$path')
      .readAsBytesSync();
}

getImageFile(String filename) {
  getImageFileFromAssets(filename).then((value) {
    return value;
  });
}

Future<bool> makeReport({plant, disease, remedy}) async {
  final user = FirebaseAuth.instance.currentUser!;
  //final User user = Authentication.getCurrentUser();
  final Logger logger = Logger('MyApp');
//   Logger.root.level = Level.ALL; // Set the desired logging level
// Logger.root.onRecord.listen((record) {
//   print('${record.level.name}: ${record.time}: ${record.message}');
// });

  logger.info('User: ${user.toString()}');
  String dateTime = DateTime.now().toString();

  Directory? appDocDirectory = await getApplicationDocumentsDirectory();
  //getExternalStorageDirectory()

  var downloads = "/storage/emulated/0/Download";

  Permission permission1 = await Permission.storage;

  var dir;
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => pw.Center(
        child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Spacer(flex: 3),
              pw.Text(dateTime),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Spacer(),
                    pw.Text("𝔾 ℕ 𝕆 𝕄 𝔼",
                        style: pw.TextStyle(
                            color: PdfColors.green,
                            fontSize: 40,
                            fontWeight: pw.FontWeight.bold)),
                    pw.Spacer(),
                  ]),
              pw.Spacer(flex: 2),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Spacer(),
                    pw.Text("Crop Analysis Report",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 32,
                            fontWeight: pw.FontWeight.bold,
                            fontStyle: pw.FontStyle.italic)),
                    pw.Spacer(),
                  ]),
              pw.Spacer(flex: 2),
              pw.Text("Username: ${user.displayName}",
                  style:
                      const pw.TextStyle(color: PdfColors.black, fontSize: 26)),
              pw.SizedBox(height: 5),
              pw.Text("Email: ${user.email}",
                  style:
                      const pw.TextStyle(color: PdfColors.black, fontSize: 26)),
              pw.SizedBox(height: 5),
              pw.Text("Plant: $plant",
                  style:
                      const pw.TextStyle(color: PdfColors.black, fontSize: 26)),
              pw.SizedBox(height: 5),
              pw.Text("Identified Disease: $disease",
                  style:
                      const pw.TextStyle(color: PdfColors.black, fontSize: 26)),
              pw.Spacer(flex: 6),
            ]),
      ),
    ),
  );

  String name = "${plant}_${dateTime}_"
      .replaceAll(' ', "_")
      .replaceAll(".", "_")
      .replaceAll(":", "_");

  var directry = await getTemporaryDirectory();
  var pathdir = directry.path;

  final file = File('$pathdir/Report_$name.pdf');
  final file2 = await file.writeAsBytes(await pdf.save());
  logger.info('File path: ${file2.path}');
  XFile xFile = XFile(file2.path); // Create an XFile object from the file path
  List<XFile> xFiles = [xFile]; // Create a list of XFile objects
  Share.shareXFiles(xFiles); // Pass the list to the Share.shareXFiles method
  //Share.shareXFiles([file.path]);

  return true;
}
