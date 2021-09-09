import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model_view/buses_model_view.dart';
import 'package:royal_travel/view/screens/setting_screen.dart';

import 'package:royal_travel/view/widgets/buses_list.dart';
import 'package:royal_travel/view/widgets/date_filter.dart';
import 'package:royal_travel/view/widgets/ticket_card.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? sDate;
  DateTime? eDate;
  void setDates(PickerDateRange range) {
    sDate = range.startDate!;
    if (range.endDate != null) eDate = range.endDate!;
    Provider.of<BusesModelView>(context, listen: false).getBuses(sDate, eDate);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DateFilter(setDates),
          BusesList(sDate, eDate),
          TicketCard(),
        ],
      ),
    );
  }
}
