import 'package:furkan_location_demo/Buinding%20Injection/detail_binding.dart';
import 'package:furkan_location_demo/Buinding%20Injection/home_binding.dart';
import 'package:furkan_location_demo/View/detail.dart';
import 'package:furkan_location_demo/View/home.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static var list = [
    GetPage(
      transition: Transition.cupertino,
      page: () => const HomeScreen(),
      name: "/",
      binding: HomeBinding(),
    ),
    GetPage(
      transitionDuration: const Duration(milliseconds: 300),
      page: () => const DetailScreen(),
      name: "/detail_screen",
      binding: DetailBinding(),
    ),
  ];
}
