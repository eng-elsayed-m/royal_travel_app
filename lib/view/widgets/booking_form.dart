import 'package:flutter/material.dart';
import 'package:royal_travel/theme.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomSheet(
          builder: (context) => Column(
            children: [
              ListTile(
                leading: Text("Name"),
                title: TextField(
                  decoration: AppTheme.inputDecoration,
                ),
              ),
            ],
          ),
          onClosing: () {},
        ));
  }
}
