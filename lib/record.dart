import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VideoRecord extends StatefulWidget {
  @override
  _VideoRecordState createState() => _VideoRecordState();
}

class _VideoRecordState extends State<VideoRecord> {
  late CameraController _controller;
  List<CameraDescription> cameras = [];
  bool isRecording = false;
  late double _minAvailableZoom;
  late double _maxAvailableZoom;
  late double _currentZoom;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.isNotEmpty) {
        setState(() {
          _controller = CameraController(cameras[0], ResolutionPreset.high);
          _controller.initialize().then((_) {
            if (!mounted) {
              return;
            }
            setState(() async {
              double _minAvailableZoom = await _controller.getMinZoomLevel();
              double _maxAvailableZoom = await _controller.getMaxZoomLevel();
              _currentZoom = _minAvailableZoom;
            });
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleZoomIn() {
    setState(() {
      _currentZoom += 1.0;
      if (_currentZoom > _maxAvailableZoom) {
        _currentZoom = _maxAvailableZoom;
      }
      _controller.setZoomLevel(_currentZoom);
    });
  }

  void _handleZoomOut() {
    setState(() {
      _currentZoom -= 1.0;
      if (_currentZoom < _minAvailableZoom) {
        _currentZoom = _minAvailableZoom;
      }
      _controller.setZoomLevel(_currentZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: <Widget>[
          CameraPreview(_controller),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.camera_front),
                  onPressed: () {},
                ),
                IconButton(
                  icon: isRecording
                      ? Icon(Icons.pause)
                      : Icon(Icons.fiber_manual_record),
                  onPressed: () {
                    setState(() {
                      isRecording = !isRecording;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.zoom_in),
                  onPressed: _handleZoomIn,
                ),
                IconButton(
                  icon: Icon(Icons.zoom_out),
                  onPressed: _handleZoomOut,
                ),
                IconButton(
                  icon: Icon(Icons.camera_rear),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
