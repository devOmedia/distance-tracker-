import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final LocationProvider = ChangeNotifierProvider<LocationNotifier>((ref) {
  return LocationNotifier();
});

class LocationNotifier extends ChangeNotifier {
  LatLng? startLocation;
  LatLng? currentLocation;

//set the starting locations.
  setStartLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);
    startLocation = location;
    notifyListeners();
  }
}
