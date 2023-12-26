import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class mapsPage extends StatefulWidget {
  const mapsPage({super.key});

  @override
  State<mapsPage> createState() => _mapsPageState();
}

class _mapsPageState extends State<mapsPage> {
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
      throw 'Could not lunch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map page'),
      ),
      body: GoogleMap(
        markers: <Marker>{
          Marker(
              markerId: const MarkerId('marker1'),
              position: const LatLng(13.788109303473627, 100.54863446761962),
              infoWindow:
                  InfoWindow(title: 'I am work at here', snippet: 'Hide out'),
              onTap:  (){
                _openGoogleMapApp(13.788109303473627, 100.54863446761962);
              }
              ),
        },
        mapType: MapType.normal,
        initialCameraPosition: position,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
