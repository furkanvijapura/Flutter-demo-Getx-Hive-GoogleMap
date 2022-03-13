import 'package:furkan_location_demo/Controller/detail_controller.dart';
import 'package:get/instance_manager.dart';

class DetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<DetaileController>(DetaileController());
 }
}