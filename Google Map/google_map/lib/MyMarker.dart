import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker MyMarker = Marker(
    markerId: MarkerId('My Place'),
    position: LatLng(34.5553, 69.2075),
    infoWindow: InfoWindow(title: "My Birth Plcae"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
