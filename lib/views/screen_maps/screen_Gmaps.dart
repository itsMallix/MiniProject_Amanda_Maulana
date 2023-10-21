import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miniproject/components/theme.dart';

class GmapsScreen extends StatefulWidget {
  const GmapsScreen({Key? key});

  @override
  State<GmapsScreen> createState() => GmapsScreenState();
}

class GmapsScreenState extends State<GmapsScreen> {
  LatLng defaultPosition = const LatLng(37.42796133580664, -122.085749655962);
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((value) {
      setState(() {
        defaultPosition = LatLng(value.latitude, value.longitude);
      });
    });
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied';
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a Place",
          style: DesignSystem.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: defaultPosition,
          zoom: 14,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 120,
            right: 12,
            child: SizedBox(
              height: 40,
              width: 150,
              child: FloatingActionButton(
                onPressed: () async {
                  try {
                    Position value = await _getCurrentLocation();
                    setState(() {
                      defaultPosition = LatLng(value.latitude, value.longitude);
                    });
                    mapController?.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: defaultPosition,
                          zoom: 14.0,
                        ),
                      ),
                    );
                  } catch (e) {
                    print('Error: $e');
                  }
                },
                backgroundColor: DesignSystem.black,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: DesignSystem.white,
                      ),
                      Text(
                        "Get My Location",
                        style: DesignSystem.bodyMediumWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}