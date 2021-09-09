import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:royal_travel/model_view/booking_model_view.dart';
import 'package:royal_travel/theme.dart';
import 'package:royal_travel/view/widgets/logo_widget.dart';

class TicketCard extends StatefulWidget {
  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModelView>(builder: (context, booking, child) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Material(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: booking.ticket == null
                      ? Center(
                          child: Text(
                            "No Tickets !",
                            style: AppTheme.bodyText5,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Bus ID : " + booking.ticket!.busId.toString(),
                                style: AppTheme.bodyText5,
                              ),
                              Text(
                                "Up time : ${booking.ticket!.date!.toString().substring(0, 16)}",
                                style: AppTheme.bodyText5,
                              ),
                              Text(
                                "Name : " + booking.ticket!.owner!,
                                style: AppTheme.bodyText5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Seats : " + booking.ticket!.seats.toString(),
                                style: AppTheme.bodyText5,
                              ),
                              FittedBox(
                                child: Text(
                                  booking.ticket!.frTo!,
                                  style: AppTheme.bodyText5,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                booking.ticket == null
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: LogoWidget(const Size(120, 120)))
                    : QrImage(
                        data: booking.ticket!.owner!,
                        version: QrVersions.auto,
                        eyeStyle: QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Theme.of(context).accentColor),
                        dataModuleStyle: QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: Theme.of(context).accentColor),
                        padding: const EdgeInsets.all(15),
                        size: 150,
                        gapless: false,
                      ),
              ],
            )),
      );
    });
  }
}
