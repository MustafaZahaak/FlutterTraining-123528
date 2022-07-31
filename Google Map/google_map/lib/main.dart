import 'package:flutter/material.dart';
import 'package:google_map/MyMarker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'FindLocation.dart';

void main() {
  runApp(const GoogleMapDemo());
}

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({Key? key}) : super(key: key);

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  // static location
  LatLng _location = LatLng(34.5553, 69.2075);

  // controller is responsible for creating the map
  GoogleMapController? mapController;

  void _mapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("GoogleMap Demo"),
      ),
      body: GoogleMap(
        markers: {MyMarker},
        onMapCreated: _mapCreated,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(target: _location, zoom: 14.0),
      ),
    ));
  }
}
