import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:latlong2/latlong.dart';

class CustomFlutterMap extends StatelessWidget {
  const CustomFlutterMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });
  final double latitude, longitude;
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(latitude, longitude),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.in_egypt',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 40,
              height: 40,
              point: LatLng(latitude, longitude),
              child: Icon(
                FontAwesomeIcons.locationDot,
                color: kMainColor,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
