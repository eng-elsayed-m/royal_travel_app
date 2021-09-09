import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model_view/location_model_view.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // MapController? _controller = MapController();
  void initialLocation() {
    Provider.of<LocationModelView>(context, listen: false).getLocation();
  }

  @override
  void initState() {
    super.initState();
    this.initialLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        child: Consumer<LocationModelView>(
            builder: (context, locationData, child) {
          return locationData.position == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FlutterMap(
                  options: MapOptions(
                      // controller: _controller,
                      center: locationData.position,
                      zoom: 18.0),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            'https://api.mapbox.com/styles/v1/elsayed-m/cksi6tlq62hle17s3hbq92pkc/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZWxzYXllZC1tIiwiYSI6ImNrc2k0ajNlNTA2bzcyb25jaGN3anJwZWkifQ.7Sp_vNlJo2nff7_HHItfEA',
                        additionalOptions: {
                          'accessToken':
                              'pk.eyJ1IjoiZWxzYXllZC1tIiwiYSI6ImNrc2k0ajNlNTA2bzcyb25jaGN3anJwZWkifQ.7Sp_vNlJo2nff7_HHItfEA',
                          'id': "mapbox.mapbox-streets-v8"
                        }),
                    CircleLayerOptions(
                      circles: [locationData.circle!],
                    ),
                    MarkerLayerOptions(
                      markers: [locationData.marker!],
                    ),
                  ],
                );
        }));
  }
}
