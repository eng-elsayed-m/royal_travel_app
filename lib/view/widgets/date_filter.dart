import 'package:flutter/material.dart';
import 'package:royal_travel/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateFilter extends StatefulWidget {
  final Function setDates;

  const DateFilter(this.setDates);
  @override
  _DateFilterState createState() => _DateFilterState();
}

DateTime? sDate;
DateTime? eDate;

class _DateFilterState extends State<DateFilter> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      shadowColor: Theme.of(context).primaryColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  Widget _datePicker = Dialog(
                      child: Container(
                          constraints: BoxConstraints(
                              minHeight: 200,
                              minWidth: 100,
                              maxHeight: 400,
                              maxWidth: 200),
                          // decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     image: DecorationImage(
                          //       image: AssetImage(
                          //         "assets/images/rt-logo.png",
                          //       ),
                          //     )),
                          child: SfDateRangePicker(
                            showActionButtons: true,

                            endRangeSelectionColor:
                                Theme.of(context).accentColor,
                            startRangeSelectionColor:
                                Theme.of(context).primaryColor,

                            // rangeSelectionColor: ,
                            selectionMode: DateRangePickerSelectionMode.range,
                            initialSelectedRange: PickerDateRange(sDate, eDate),
                            onCancel: () => Navigator.of(context).pop(),
                            onSubmit: (obj) {
                              if (obj is PickerDateRange) {
                                sDate = obj.startDate!;
                                if (obj.endDate != null) eDate = obj.endDate!;
                                widget.setDates(obj);
                                Navigator.of(context).pop();
                              }
                            },
                          )));
                  showDialog(context: context, builder: (ctx) => _datePicker);
                },
                style: AppTheme.buttonStyle,
                child: Text("Pick Range")),
            if (sDate != null)
              Material(
                color: Colors.white,
                elevation: 0,
                borderRadius: BorderRadius.circular(25),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: Text(
                    sDate!.toIso8601String().split("T").first,
                    style: AppTheme.bodyText4,
                  ),
                ),
              ),
            if (eDate != null)
              Material(
                color: Colors.white,
                elevation: 0,
                borderRadius: BorderRadius.circular(25),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: Text(
                    eDate!.toIso8601String().split("T").first,
                    style: AppTheme.bodyText4,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
