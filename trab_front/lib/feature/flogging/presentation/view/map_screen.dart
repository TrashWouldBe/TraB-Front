import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/map_screen_view_model.dart';

//TODO: 10초마다 받아와서 polylines에 저장 ㅠ

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends ConsumerState<MapScreen> {
  GoogleMapController? mapController;

  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  Timer? timer;
  LatLng? lastPosition;

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(
    //     const Duration(seconds: 3), (Timer t) => _getCurrentLocation());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _updatePolyline() {
    setState(() {
      Polyline polyline = Polyline(
        polylineId: PolylineId('poly'),
        visible: true,
        points: polylineCoordinates,
        width: 5,
        color: Colors.blue,
      );
      polylines = {polyline};
    });
  }

  @override
  Widget build(BuildContext context) {
    var _currentLocation =
        ref.watch(mapScreenControllerProvider).currentLocation;
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: ref.read(mapScreenControllerProvider.notifier).onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _currentLocation,
        zoom: 17.0,
      ),
      polylines: polylines,
      myLocationButtonEnabled: true,
      buildingsEnabled: false,
    );
  }
}
