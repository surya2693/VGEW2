import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/services.dart'; // For asset loading
// import 'package:three_js/three_js.dart' as three;


Future<String> _loadGltfAsset() async {
  return await rootBundle.loadString('assets/your_model.gltf'); // Replace with your asset path
}

class GltfViewer extends StatefulWidget {
  @override
  _GltfViewerState createState() => _GltfViewerState();
}

class _GltfViewerState extends State<GltfViewer> {
  late String _gltfString;

  @override
  void initState() {
    super.initState();
    _loadGltfAsset().then((gltfString) {
      setState(() {
        _gltfString = gltfString;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_gltfString.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      // body: ThreeDView( // Assuming your package provides a ThreeDView widget
      //   onSceneCreated: (scene) {
      //     // Parse the GLTF string and load the model into the scene
      //     three.GLTFLoader loader = three.GLTFLoader(flipY: true).setPath('assets/');
      //     loader.parse(_gltfString, (gltf) {
      //       scene.add(gltf.scene);
      //     });
      //   },
      // ),
    );
  }
}