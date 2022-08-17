import 'dart:async';
import 'package:cstar_image_clone/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:custom_info_window/custom_info_window.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Set<Marker> _markers = {};
  final GlobalKey globalKey = GlobalKey();
  final LatLng _latLng = const LatLng(37.5301773, 126.9716482);
  late final Uri _url;

  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  @override
  void initState() {
    super.initState();
    _url = Uri.parse(cstarAddress);
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Widget windowInfo() => Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 5,
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                '서울특별시 용산구\n한강로2가 71',
                style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );

  void addMarker() async {
    _markers.add(
      Marker(
          markerId: const MarkerId('CSTAR'),
          draggable: true,
          position: _latLng,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(windowInfo(), _latLng);
          }),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
     _customInfoWindowController.googleMapController = controller;
    _customInfoWindowController.addInfoWindow!(windowInfo(), _latLng);
  }

  @override
  Widget build(BuildContext context) {
    addMarker();
    return GestureDetector(
      onTap: () {
        _launchUrl();
      },
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.5321773, 126.9716482),
              zoom: 14.4746,
            ),
            markers: _markers,
            onMapCreated: _onMapCreated,
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
          ),
          CustomInfoWindow(
              controller: _customInfoWindowController, height: 60, width: 150, offset: 37)
        ],
      ),
    );
  }
}
