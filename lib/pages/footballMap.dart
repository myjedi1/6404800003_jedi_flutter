import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class footballMap extends StatefulWidget {
  const footballMap({super.key});

  @override
  State<footballMap> createState() => _footballMapState();
}

class _footballMapState extends State<footballMap> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition position = CameraPosition(
    target: LatLng(13.788109303473627, 100.54863446761962), //
    zoom: 20,
  );
  _openGoogleMapApp(double lat, double long) async {
    var url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Set<Marker> _markers = {};

  Future<void> goToPlace(double latt, double lngg) async {
    final double lat = latt;
    final double lng = lngg;
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 16)));

    //add Marker
    _markers.add(
      Marker(
        markerId: MarkerId('place_marker'),
        position: LatLng(lat, lng),
        // infoWindow:
        //     InfoWindow(title: '', snippet: 'Marker Description'),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> location =
        ModalRoute.of(context)!.settings.arguments as Map<String, double>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Map page'),
      ),
      body: GoogleMap(
        markers: <Marker>{
          Marker(
              markerId: const MarkerId('marker1'),
              position: LatLng(location['lat']! ,location['lng']!),
              infoWindow:
                  InfoWindow(title: 'I am work at here', snippet: 'Hide out'),
              onTap: () {
                _openGoogleMapApp(13.788109303473627, 100.54863446761962);
              }),
        },
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(location['lat']!, location['lng']!), //
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
