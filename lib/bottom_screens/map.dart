import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(36.4513, 10.7357),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/bilel1997/clvz8eedy02dq01qp00wo47hj/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYmlsZWwxOTk3IiwiYSI6ImNsdnY5cTkxeTFiMmcybG55d2kyNnBueGYifQ.3_1LBiD0QgTRZ9xOVtedFA',
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiYmlsZWwxOTk3IiwiYSI6ImNsdnY5cTkxeTFiMmcybG55d2kyNnBueGYifQ.3_1LBiD0QgTRZ9xOVtedFA',
                'id': 'bilel1997.8hppafcg'
              },
              userAgentPackageName: 'com.example.app',
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
