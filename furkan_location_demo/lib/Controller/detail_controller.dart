import 'dart:async';

import 'package:furkan_location_demo/Model/location_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetaileController extends GetxController {
  var locationData = LocationHiveModel().obs;

  Completer<GoogleMapController> mapController = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 50,
  );

  @override
  Future onInit() async {
    final argValue = Get.arguments as LocationHiveModel;
    locationData.value = argValue;

    final CameraPosition _kLake = CameraPosition(
        bearing: 50,
        target: LatLng(argValue.lat ?? 0.00, argValue.lon ?? 0.00),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

    super.onInit();
  }
}
