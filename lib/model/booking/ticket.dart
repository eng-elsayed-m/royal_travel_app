import 'package:flutter/cupertino.dart';

class Ticket {
  final int? busId;
  final String? owner;
  final int? seats;
  final DateTime? date;
  final String? frTo;

  Ticket(
      {@required this.busId,
      @required this.owner,
      @required this.seats,
      @required this.date,
      @required this.frTo});
}
