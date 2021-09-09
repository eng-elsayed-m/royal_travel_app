import 'package:flutter/material.dart';
import 'package:royal_travel/model/bus/bus.dart';
import 'package:royal_travel/view/widgets/bus_info.dart';
import 'package:royal_travel/view/widgets/map.dart';

// For Management
class BusScreen extends StatelessWidget {
  final Bus bus;
  const BusScreen(this.bus);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MapView(),
              BusInfo(bus),
            ],
          ),
        ),
      ),
    );
  }
}
