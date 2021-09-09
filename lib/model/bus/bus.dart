import 'package:flutter/cupertino.dart';

class Bus {
  final int? id;
  final String? departmentStation;
  final String? arrivalStation;
  final DateTime? upTime;
  final int? capacity;
  final int? reserved;
  final String? image;
  final List? passengers;

  Bus({
    @required this.id,
    @required this.departmentStation,
    @required this.arrivalStation,
    @required this.upTime,
    @required this.capacity,
    @required this.reserved,
    @required this.image,
    @required this.passengers,
  });
}
