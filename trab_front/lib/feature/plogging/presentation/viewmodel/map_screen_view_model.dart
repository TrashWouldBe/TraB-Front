import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
part 'map_screen_view_model.g.dart';

class MapScreenState {
  GoogleMapController? mapController;
  Set<Polyline> polylines;
  LatLng currentLocation;
  List<LatLng> polylineCoordinates;
  LatLng? lastPosition;

  MapScreenState({
    required this.mapController,
    required this.polylines,
    required this.currentLocation,
    required this.polylineCoordinates,
    this.lastPosition,
  });
}

@riverpod
class MapScreenController extends _$MapScreenController {
  @override
  MapScreenState build() {
    return MapScreenState(
      mapController: null,
      polylines: {},
      currentLocation: const LatLng(37.555922776159356, 127.04933257899165),
      polylineCoordinates: [],
    );
  }

  Location location = Location();
  StreamSubscription<LocationData>? locationSubscription;

  void setState() {
    state = MapScreenState(
      mapController: state.mapController,
      polylines: state.polylines,
      lastPosition: state.lastPosition,
      currentLocation: state.currentLocation,
      polylineCoordinates: state.polylineCoordinates,
    );
  }

  void onMapCreated(GoogleMapController controller) async {
    state.mapController = controller;

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    await location.enableBackgroundMode(enable: true);

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

  //TODO: 시뮬레이터로 시험해보기
  void startLocationSubscription() async {
    if (locationSubscription != null) {
      if (locationSubscription!.isPaused) {
        locationSubscription!.resume();
        return;
      }
    }

    bool changeSettings = await location.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000,
      distanceFilter: 0,
    );

    if (changeSettings) {
      locationSubscription =
          location.onLocationChanged.listen((LocationData currentLocation) {
        LatLng newPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        ref.read(ploggingInfoControllerProvider.notifier).calculateDistance(
              lastPosition: state.lastPosition,
              newPosition: newPosition,
            );
        state.polylineCoordinates.add(newPosition);
        state.lastPosition = newPosition;
        Polyline polyline = Polyline(
          polylineId: const PolylineId('poly'),
          visible: true,
          points: state.polylineCoordinates,
          width: 7,
          color: AppColors.primaryColor,
        );
        state.polylines = {polyline};

        setState();
      });
    }
  }

  void clearPolylines() {
    if (locationSubscription != null) {
      state.polylines = {};
      state.polylineCoordinates = [];
      locationSubscription!.cancel();
      setState();
    }
  }

  void cancleLocationSubscription() {
    if (locationSubscription != null) {
      locationSubscription!.pause();
    }
  }
}
