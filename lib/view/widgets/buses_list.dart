import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model/api/api_response.dart';
import 'package:royal_travel/model_view/buses_model_view.dart';
import 'package:royal_travel/theme.dart';
import 'package:royal_travel/view/screens/bus_screen.dart';
import 'package:royal_travel/view/widgets/bus_card.dart';

class BusesList extends StatelessWidget {
  final DateTime? sDate;
  final DateTime? eDate;

  const BusesList(this.sDate, this.eDate);
  @override
  Widget build(BuildContext context) {
    final ApiResponse apiResponse =
        Provider.of<BusesModelView>(context).response;
    final dSize = MediaQuery.of(context).size;
    final dOrient = MediaQuery.of(context).orientation;

    return Container(
        // padding: EdgeInsets.only(top: 20),
        height: dOrient == Orientation.landscape
            ? dSize.height * 0.75
            : dSize.height * 0.45,
        width: dSize.width,
        // color: AppTheme.appColors["yellow-main"]!.withOpacity(0.3),
        child: Builder(builder: (context) {
          switch (apiResponse.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                child: Text(
                  apiResponse.message!,
                  style: AppTheme.bodyText2,
                ),
              );
            case Status.COMPLETE:
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BusScreen(apiResponse.data[index]),
                          )),
                      child: BusCard(apiResponse.data[index])),
                  itemCount: apiResponse.data.length,
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  scrollDirection: Axis.horizontal);
            default:
              return Center(
                child: Text(apiResponse.message!),
              );
          }
        }));
  }
}
