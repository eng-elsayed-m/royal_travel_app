import 'package:flutter/material.dart';
import 'package:royal_travel/model/bus/bus.dart';
import 'package:royal_travel/theme.dart';

class BusInfo extends StatefulWidget {
  final Bus bus;

  const BusInfo(this.bus);

  @override
  _BusInfoState createState() => _BusInfoState();
}

class _BusInfoState extends State<BusInfo> with SingleTickerProviderStateMixin {
  bool isExpand = false;
  Animation<double>? _doubleAnimation;
  AnimationController? _animationController;
  void expand() {
    isExpand
        ? _animationController!.reverse()
        : _animationController!.forward();
    isExpand = !isExpand;
  }

  @override
  void initState() {
    super.initState();
    // final deviceH = MediaQuery.of(context).size.height;

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        value: 0,
        reverseDuration: Duration(milliseconds: 300));
    _doubleAnimation =
        Tween<double>(begin: 0.0, end: 500.0).animate(_animationController!)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Material(
          color: Theme.of(context).primaryColor,
          elevation: 3,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              widget.bus.departmentStation!,
              style: AppTheme.bodyText5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              widget.bus.arrivalStation!,
              style: AppTheme.bodyText5,
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              Icon(
                Icons.timelapse,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 7.0,
              ),
              Text(
                widget.bus.upTime!.toString().substring(0, 16),
                style: AppTheme.bodyText2,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Book a seat"),
            style: AppTheme.buttonStyle,
          )
        ]),
        const SizedBox(
          height: 15,
        ),
        Material(
          child: Column(
            children: [
              // InkWell(
              //   onTap: expand,
              //   child: Card(
              //     color: Theme.of(context).primaryColor,
              //     elevation: 5,
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 20, vertical: 10),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(widget.bus.reserved.toString() + "  Place booked"),
              //           Icon(
              //             isExpand
              //                 ? Icons.arrow_drop_up
              //                 : Icons.arrow_drop_down,
              //             size: 40,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // isExpand
              //     ? AnimatedContainer(
              //         duration: _animationController!.duration!,
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         curve: Curves.easeOutQuad,
              //         height: _doubleAnimation!.value,
              //         child: Column(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.symmetric(vertical: 8.0),
              //               child: Table(columnWidths: {
              //                 0: FlexColumnWidth(0.2),
              //                 1: FlexColumnWidth(1),
              //                 2: FlexColumnWidth(0.8),

              //                 3: FlexColumnWidth(0.7),
              //                 // 3: FlexColumnWidth(0.7),
              //               }, children: [
              //                 TableRow(children: [
              //                   Text("#"),
              //                   Text("Name"),
              //                   Text("Pickup Location"),
              //                   Text("Phone number"),
              //                 ]),
              //               ]),
              //             ),
              //             Divider(
              //               color: Theme.of(context).accentColor,
              //               thickness: 2,
              //               height: 0,
              //             ),
              //             Flexible(
              //                 flex: 7,
              //                 child: SingleChildScrollView(
              //                     child: Table(
              //                         defaultVerticalAlignment:
              //                             TableCellVerticalAlignment.middle,
              //                         columnWidths: {
              //                           0: FlexColumnWidth(0.2),
              //                           1: FlexColumnWidth(1),
              //                           2: FlexColumnWidth(0.8),

              //                           3: FlexColumnWidth(0.7),
              //                           // 3: FlexColumnWidth(0.8),
              //                         },
              //                         children: widget.bus.passengers!
              //                             .map(
              //                               (passenger) => TableRow(children: [
              //                                 Padding(
              //                                   padding:
              //                                       const EdgeInsets.symmetric(
              //                                           vertical: 5),
              //                                   child: Text(passenger["number"]
              //                                       .toString()),
              //                                 ),
              //                                 Padding(
              //                                   padding:
              //                                       const EdgeInsets.symmetric(
              //                                           vertical: 5),
              //                                   child: Text(passenger["name"]),
              //                                 ),
              //                                 Padding(
              //                                   padding:
              //                                       const EdgeInsets.symmetric(
              //                                           vertical: 5),
              //                                   child: Text(passenger["pickL"]),
              //                                 ),
              //                                 Padding(
              //                                   padding:
              //                                       const EdgeInsets.symmetric(
              //                                           vertical: 5),
              //                                   child: Text(passenger["phone"]
              //                                       .toString()),
              //                                 ),
              //                               ]),
              //                             )
              //                             .toList()))),
              //           ],
              //         ),
              //       )
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(35),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      children: [
                        // Text(
                        //   "Bus Info",
                        //   style: AppTheme.bodyText1,
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Model",
                              style: AppTheme.bodyText2,
                            ),
                            Spacer(),
                            Text(
                              "ymnuv55",
                              style: AppTheme.bodyText5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "No.",
                              style: AppTheme.bodyText2,
                            ),
                            Spacer(),
                            Text(
                              "6666 | MVVM",
                              style: AppTheme.bodyText5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone",
                              style: AppTheme.bodyText2,
                            ),
                            Spacer(),
                            Text(
                              "01025326232",
                              style: AppTheme.bodyText5,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Capacity",
                              style: AppTheme.bodyText2,
                            ),
                            Spacer(),
                            Text(
                              "50 passenger",
                              style: AppTheme.bodyText5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
