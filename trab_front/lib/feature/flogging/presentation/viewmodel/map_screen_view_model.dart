import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'map_screen_view_model.g.dart';

class MapScreenState {
  GoogleMapController? mapController;
  Set<Polyline> polylines;
  LatLng currentLocation;
  MapScreenState({
    required this.mapController,
    required this.polylines,
    required this.currentLocation,
  });
}

@riverpod
class MapScreenController extends _$MapScreenController {
  @override
  MapScreenState build() {
    return MapScreenState(
        mapController: null,
        polylines: {},
        currentLocation: const LatLng(37.555922776159356, 127.04933257899165));
  }

  Location location = Location();
  StreamSubscription<LocationData>? locationSubscription;

  void setState() {
    state = MapScreenState(
      mapController: state.mapController,
      polylines: state.polylines,
      currentLocation: state.currentLocation,
    );
  }

  void onMapCreated(GoogleMapController controller) {
    state.mapController = controller;
    getInitialLocation();
  }

  void getInitialLocation() async {
    Location location = Location();
    final currentLocation = await location.getLocation();

    if (state.mapController != null) {
      state.mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 17.0,
        ),
      ));
      state.currentLocation =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      setState();
    }
  }

  void getCurrentLocation() async {
    locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      state.currentLocation =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      setState();
    });
  }

  void stopListening() {
    if (locationSubscription != null) {
      locationSubscription!.cancel();
    }
  }
}
