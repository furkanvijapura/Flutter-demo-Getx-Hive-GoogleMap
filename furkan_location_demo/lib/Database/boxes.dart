import 'package:furkan_location_demo/Model/location_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<LocationHiveModel> getLocations() =>
      Hive.box<LocationHiveModel>('locationHiveData');
}
