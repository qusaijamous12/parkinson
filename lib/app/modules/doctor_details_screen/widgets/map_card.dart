import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 210,
        padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/2),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorManager.kPrimary.withValues(alpha: 0.4),
                blurRadius: 10,
                spreadRadius: 2,
                offset:const Offset(0, 4), // shadow position
              ),
            ],
            borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius)
        ),
        child:FlutterMap(
          options:const MapOptions(
            initialCenter: LatLng(31.9454, 35.9284),
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.parknson_app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point:const LatLng(31.9454, 35.9284),
                  width: 40,
                  height: 40,
                  child:  Icon(
                    Icons.location_pin,
                    color: ColorManager.kPrimary,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],

        )
    );
  }
}
