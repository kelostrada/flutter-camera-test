import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TestViewState();
}

class TestViewState extends State<TestView> {
  CameraController controller;

  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(),
      body: _buildCameraPreview(),
    );

  }

  Widget _buildCameraPreview() {
    if (controller == null || controller.value == null || !controller.value.isInitialized) return new Container();

    return new AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: new CameraPreview(controller),
    );
  }

}

