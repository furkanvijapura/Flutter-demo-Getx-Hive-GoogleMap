import 'package:flutter/material.dart';
import 'package:furkan_location_demo/Controller/home_controller.dart';
import 'package:furkan_location_demo/Model/location_model.dart';

class ListCellWidget extends StatelessWidget {
  const ListCellWidget({
    Key? key,
    required this.dataObjc,
    required this.linerGradiant,
  }) : super(key: key);

  final LocationHiveModel dataObjc;
  final LinearGradient linerGradiant;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      width: 140,
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: InkWell(
          onTap: () {
            HomeController.i.toDetail(dataObjc);
          },
          child: ListTile(
            title: Text(
              (dataObjc.name ?? "no data").replaceAll(RegExp('/'), ''),
            ),
            subtitle: Text(
              (dataObjc.city ?? "") +
                  ", " +
                  (dataObjc.state ?? "") +
                  ", " +
                  (dataObjc.country ?? ""),
              style: const TextStyle(
                wordSpacing: 1.2,
              ),
              // maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            trailing: Text(
              dataObjc.icao ?? "no code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                foreground: Paint()
                  ..shader = linerGradiant.createShader(
                      const Rect.fromLTWH(0.10, 0.0, 200.0, 70.0)),
              ),
            ),
          )),
    );
  }
}
