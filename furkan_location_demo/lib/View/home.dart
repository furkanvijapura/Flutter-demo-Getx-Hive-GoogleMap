import 'package:flutter/material.dart';
import 'package:furkan_location_demo/App%20Widgets/list_cell_w.dart';
import 'package:furkan_location_demo/Database/boxes.dart';
import 'package:furkan_location_demo/Model/location_model.dart';
import 'package:furkan_location_demo/styles/gradiants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradiant.linerGradiant,
        ),
        child: ValueListenableBuilder<Box<LocationHiveModel>>(
            valueListenable: Boxes.getLocations().listenable(),
            builder: (context, box, _) {
              final locations = box.values.toList().cast<LocationHiveModel>();
              return locations.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      itemCount: locations.length,
                      itemBuilder: (BuildContext content, int index) {
                        final dataObjc = locations[index];
                        return ListCellWidget(
                            dataObjc: dataObjc,
                            linerGradiant: AppGradiant.linerGradiant);
                      })
                  : const Center(
                      child: Text(
                        'Fetching data...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal,),
                      ),
                    );
            }),
      ),
    );
  }
}
