import 'package:get/get.dart';
import 'package:first_app/pages/doctor/pages/image_preview.dart';
import 'package:first_app/pages/doctor/widgets/photo_button.dart';
import 'package:flutter/material.dart';

// import './../screens/image_search.dart';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

enum Camera { backCamera, frontCamera }

class CameraPage extends StatefulWidget {
  static const String route = '/CameraPage';
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  Camera chosenCamera = Camera.backCamera;
  var controller;
  // late CameraController _controller;

  Future<void> _initCameraController(
      CameraDescription cameraDescription) async {
    // if (_controller != null) {
    //   await _controller.dispose();
    // }
    print("started");
    controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      CameraDescription firstCamera = cameras.first;
      await _initCameraController(firstCamera);
    } catch (e) {
      print('******** CAMERA ERROR $e*********');
    }
  }

  Future<void> _chooseImageFromGallery() async {
    // PickedFile? image =
    //     await ImagePicker().getImage(source: ImageSource.gallery);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final String imagePath = image.path;
      print("Hurraayyy $imagePath");
      Get.to(() => ImagePreview(imagePath: imagePath));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ImagePreviewPage(imagePath: imagePath),
      //   ),
      // );
    }
  }

  Future<void> _takePhoto() async {
    try {
      final String imagePath =
          '${(await getTemporaryDirectory()).path}/${DateTime.now()}.png';
      setState(() {});

      var picture = await controller.takePicture(); //take photo
      picture.saveTo(imagePath);

      print("hurraahhh  : " + imagePath);
      Get.to(() => ImagePreview(imagePath: imagePath));

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ImagePreviewPage(imagePath: imagePath),
      //   ),
      // );
    } catch (e) {
      print('************ ERROR : $e *******************');
    }
  }

  Future<void> _switchCamera() async {
    switch (chosenCamera) {
      case Camera.backCamera:
        chosenCamera = Camera.frontCamera;
        setState(() {});
        break;
      case Camera.frontCamera:
        chosenCamera = Camera.backCamera;
        setState(() {});
        break;
    }
    await _initCameraController(cameras[chosenCamera.index]);
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

//on pause camera is disposed, so we need to call again "issue is only for android"
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed ||
        state == AppLifecycleState.inactive) {
      controller?.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      ); // Otherwise, display a loading indicator.
    }

    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * controller.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Transform.scale(
                scale: scale,
                child: CameraPreview(controller), //cameraPreview
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: FloatingActionButton(
                        elevation: 0.0,
                        onPressed: _chooseImageFromGallery,
                        backgroundColor: Colors.black26,
                        child: const Icon(Icons.image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: PhotoButton(
                        onTap: _takePhoto,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: FloatingActionButton(
                        elevation: 0.0,
                        heroTag: "Switch",
                        onPressed: _switchCamera,
                        backgroundColor: Colors.black26,
                        child: const Icon(Icons.sync),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        //
      ),
    );
  }
}
