import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class AttendPage extends StatefulWidget {
  final int classID;
  AttendPage({Key key, @required this.classID}) : super(key: key);

  @override
  _AttendPageState createState() => _AttendPageState();
}

class _AttendPageState extends State<AttendPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  var isCameraReady = false;
  var showCapturedPhoto = false;
  var ImagePath;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Turn on the camera!!!!"),
      ),
    );
  }
}
