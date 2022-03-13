import 'package:dio/dio.dart';
import 'package:furkan_location_demo/Constant/network_const.dart';
import 'package:furkan_location_demo/Model/location_model.dart';

class HomeNetwork {
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/$kFileName');
  // }

  // Future<String> downloadFile() async {
  //   Dio dio = Dio();

  //   var dir = await getApplicationDocumentsDirectory();
  //   var imageDownloadPath = '${dir.path}/$kFileName';
  //   await dio.download(ConstNetwork().baseUrl, imageDownloadPath,
  //       onReceiveProgress: (received, total) {
  //     var progress = (received / total) * 100;
  //     debugPrint('Rec: $received , Total: $total, $progress%');

  //     double downloadProgress = received.toDouble() / total.toDouble();
  //     print(downloadProgress);
  //   });
  //   // downloadFile function returns path where image has been downloaded
  //   return imageDownloadPath;
  // }

  Future<Map<String, LocationModel>> fetchLocationList() async {
    try {
      Response response = await Dio().get(ConstNetwork().baseUrl);
      if (response.statusCode == 200){
        return locationModelFromJson(response.data);
      } else {
        throw Exception("Invalid data");
      }
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
