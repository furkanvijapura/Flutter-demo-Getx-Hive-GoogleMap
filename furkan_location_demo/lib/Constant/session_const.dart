import 'package:furkan_location_demo/Constant/secure_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionConst {
  //Set Location path
  static Future setLocationPath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SecureConstant.LOCATION_PATH_KEY, path);
  }
}
