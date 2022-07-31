import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({Key key}) : super(key: key);

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  LatLng _location = LatLng(25.2048, 55.2708);
  GoogleMapController mapController;

  void _mapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map Demo"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _location, zoom: 14),
        onMapCreated: _mapCreated,
      ),
    );
  }
}
