import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker JumeraMarker = Marker(
    markerId: MarkerId("Jumera Mosque"),
    position: LatLng(25.233960, 55.265889),
    infoWindow: InfoWindow(title: "Jumera Mosque"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
