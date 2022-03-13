import 'package:furkan_location_demo/Database/boxes.dart';
import 'package:furkan_location_demo/Model/location_model.dart';
import 'package:furkan_location_demo/Network%20Services/home_network.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  static HomeController get i => Get.find();

  // Do owsemmmm

  @override
  void onInit() async {
    final box = Boxes.getLocations();

    if (box.isEmpty) {
      HomeNetwork().fetchLocationList().then((value) {
        if (value.isNotEmpty) {
          print("LOAD FROM INTERNET");
          for (var e in value.entries) {
            final location = LocationHiveModel()
              ..name = e.value.name
              ..city = e.value.city
              ..state = e.value.state
              ..country = e.value.country
              ..icao = e.value.icao
              ..lat = e.value.lat
              ..lon = e.value.lon;
            box.add(location);
          }
        }
      }).catchError((onError) => print("catch error ::" + onError.toString()));
    }
    super.onInit();
  }

  @override
  void onClose() {
    Hive.box('locationHiveData').close();
    super.onClose();
  }

  void toDetail(LocationHiveModel location) {
    print("lat -> ${location.lat}  lon -> ${location.lon}");

    Get.toNamed('/detail_screen', arguments: location);
  }
}
