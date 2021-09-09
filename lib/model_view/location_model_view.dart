import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class LocationModelView extends ChangeNotifier {
  LocationData? _location;
  LocationData get location => _location!;
  Marker? _marker;
  CircleMarker? _circle;

  Marker? get marker => _marker;
  CircleMarker? get circle => _circle;
  LatLng? _position;
  LatLng? get position => _position;

  ////////////////////////(((((((((((((()))))))))))))))//////////////////////////

  void updateMarkerAndCircle(LocationData newLocalData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    _marker = Marker(
      point: latlng,
      rotate: true,
      anchorPos: AnchorPos.align(AnchorAlign.center),
      builder: (context) => Icon(
        Icons.location_pin,
        size: 25,
        color: Colors.redAccent,
      ),
    );
    _circle = CircleMarker(
        useRadiusInMeter: true,
        point: latlng,
        radius: newLocalData.accuracy!,
        color: Colors.lightBlueAccent.withOpacity(0.25));
    notifyListeners();
  }

  Future<void> getLocation() async {
    final loc = new Location();
    try {
      _location = await loc.getLocation();
    } catch (e) {
      throw e;
    }
    loc.onLocationChanged.listen((currentLocation) {
      _location = currentLocation;
      _position = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      print(_position.toString());
      print("location changed");
      return updateMarkerAndCircle(currentLocation);
    });
  }
}
