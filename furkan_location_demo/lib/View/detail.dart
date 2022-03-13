import 'package:flutter/material.dart';
import 'package:furkan_location_demo/Controller/detail_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetX<DetaileController>(builder: (builder) {
            final data = builder.locationData.value;
            return GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(data.lat ?? 0.00, data.lon ?? 0.00),
                zoom: 17,
              ),
              onMapCreated: (GoogleMapController controller) {
                builder.mapController.complete(controller);
              },
              markers: <Marker>{
                Marker(
                  draggable: true,
                  markerId: const MarkerId("1"),
                  position: LatLng(data.lat ?? 0.00, data.lon ?? 0.00),
                  icon: BitmapDescriptor.defaultMarker,
                  infoWindow: InfoWindow(
                    title: data.name ?? "Airport",
                  ),
                )
              },
            );
          }),
          Positioned(
            left: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
