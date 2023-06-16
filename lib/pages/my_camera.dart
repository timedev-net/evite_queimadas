import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class MyCamera extends StatefulWidget {
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  List<CameraDescription> cameras = [];
  CameraController? camController;
  XFile? imagem;
  Size? size;

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  _loadCameras() async {
    try {
      cameras = await availableCameras();
      _startCamera();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  _startCamera() {
    if (cameras.isEmpty) {
      print('Camera não encontrada');
    } else {
      _previewCamera(cameras.first);
    }
  }

  _previewCamera(CameraDescription camera) async {
    final CameraController cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    camController = cameraController;

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Foto', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: _arquivoWidget(),
        ),
      ),
      // floatingActionButton: (imagem != null) ? FloatingActionButton.extended(onPressed: () => Navigator.pop(context), label: Text('Finalizar')) : null,
    );
  }

  _arquivoWidget() {
    return Container(
      width: size!.width - 50,
      height: size!.height - (size!.height / 3),
      child: imagem == null ? _cameraPreviewWidget() : Image.file(File(imagem!.path), fit: BoxFit.contain),
    );
  }

  _cameraPreviewWidget() {
    final CameraController? cameraController = camController;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Text('não disponível');
    } else {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CameraPreview(camController!),
          _botaoCapturaWidget(),
        ],
      );
    }
  }

  _botaoCapturaWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.black.withOpacity(0.5),
        child: IconButton(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 30,
          ),
          onPressed: tirarFoto,
        ),
      ),
    );
  }

  tirarFoto() async {
    final CameraController? cameraController = camController;
    if (cameraController != null && cameraController.value.isInitialized) {
      try {
        XFile file = await cameraController.takePicture();
        if (mounted) {
          setState(() => imagem = file);
          Navigator.pop(context);
        }
      } on CameraException catch (e) {
        print(e.description);
      }
    }
  }
}
