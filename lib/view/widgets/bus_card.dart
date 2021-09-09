import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model/booking/ticket.dart';
import 'package:royal_travel/model/bus/bus.dart';
import 'package:royal_travel/model_view/booking_model_view.dart';
import 'package:royal_travel/theme.dart';

class BusCard extends StatefulWidget {
  final Bus bus;

  const BusCard(this.bus);

  @override
  _BusCardState createState() => _BusCardState();
}

class _BusCardState extends State<BusCard> {
  @override
  Widget build(BuildContext context) {
    //  int seatsCount = 0;
    //  List seats = [];

    void addTicket() {
      String name = "";
      int nuSeats = 0;
      showDialog(
        context: context,
        builder: (ctx) => SimpleDialog(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Bus:  " + widget.bus.id.toString(),
              style: AppTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    hintText: "Enter your name"),
                onChanged: (value) => name = value,
              ),
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<BookingModelView>(context, listen: false)
                        .addTicket(
                      tic: Ticket(
                          busId: widget.bus.id,
                          owner: name,
                          seats: nuSeats,
                          date: widget.bus.upTime,
                          frTo: widget.bus.departmentStation! +
                              "  to  " +
                              widget.bus.arrivalStation!),
                      onDidReceiveLocalNotification: () {},
                    );
                    Navigator.pop(ctx);
                  },
                  icon: Icon(
                    Icons.done,
                    color: Theme.of(context).primaryColor,
                    size: 35,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    border: InputBorder.none,
                    hintText: "Enter number of seats"),
                keyboardType: TextInputType.number,
                onChanged: (value) => nuSeats = int.parse(value),
              ),
              trailing: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).accentColor,
                    size: 35,
                  )),
            ),
          ),
        ]),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 17, left: 12, right: 12),
      child: Material(
        borderOnForeground: true,
        animationDuration: Duration(seconds: 2),
        shadowColor: Theme.of(context).primaryColor,
        elevation: 3,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 8,
                child: Container(
                    // height: 190,
                    // width: 250,
                    constraints: BoxConstraints(
                        maxHeight: 220,
                        minHeight: 180,
                        maxWidth: 350,
                        minWidth: 260),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/bus.png",
                          color: Theme.of(context).primaryColor,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          child: Text(
                            "Bus : " + widget.bus.id.toString(),
                            style: AppTheme.bodyText2,
                          ),
                          bottom: 5,
                          right: 50,
                        )
                      ],
                    )
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(35),
                    //         topRight: Radius.circular(35)),
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/images/bus.png"),
                    //         // NetworkImage(
                    //         //   bus.image!,
                    //         // ),
                    //         fit: BoxFit.fitWidth)),
                    )),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: FittedBox(
                child: Text(
                  "  Up Time : " +
                      widget.bus.upTime!.toString().substring(0, 16),
                  style: AppTheme.bodyText2,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "  From : " + widget.bus.departmentStation!,
                  style: AppTheme.bodyText3,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "  To : " + widget.bus.arrivalStation!,
                  style: AppTheme.bodyText3,
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                child: Text(
                  "  Empty Seats : ${widget.bus.capacity! - widget.bus.reserved!}",
                  style: AppTheme.bodyText3,
                  softWrap: true,
                ),
              ),
            ),
            Container(
              width: 260,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: addTicket,
                    style: AppTheme.buttonStyle,
                    //  booking.ticket!.busId == bus.id
                    //     ? AppTheme.buttonStyle
                    //     : AppTheme.buttonStyle.copyWith(
                    //         backgroundColor: MaterialStateProperty.all(
                    //             Colors.transparent)),
                    child: Text("BOOK A SEAT"),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  // // ElevatedButton(
                  // //   onPressed: addTicket,
                  // //   style: AppTheme.buttonStyle,
                  // //   //  booking.ticket!.busId == bus.id
                  // //   //     ? AppTheme.buttonStyle
                  // //   //     : AppTheme.buttonStyle.copyWith(
                  // //   //         backgroundColor: MaterialStateProperty.all(
                  // //   //             Colors.transparent)),
                  // //   child: Text("BOOK FOR"),
                  // // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
