import 'package:flutter/foundation.dart';
import 'package:royal_travel/model/api/api_response.dart';
import 'package:royal_travel/model/bus/bus.dart';
import 'package:royal_travel/model/bus/buses_repository.dart';

class BusesModelView extends ChangeNotifier {
  ApiResponse? _apiResponse;
  List<Bus> _buses = [];
  ApiResponse get response => _apiResponse!;
  List<Bus> get buses => _buses;

  Future<void> getBuses([DateTime? sDate, DateTime? eDate]) async {
    _apiResponse = ApiResponse.loading("Loading...");
    // notifyListeners();
    // notifyListeners();
    try {
      _buses = await BusesRepository().fetchBusesData();

      if (sDate != null) {
        _buses = _buses
            .where((element) =>
                element.upTime!.isAfter(sDate.subtract(Duration(days: 1))))
            .toList();
      }
      if (eDate != null) {
        _buses = _buses
            .where((element) =>
                element.upTime!.isBefore(eDate.add(Duration(days: 1))))
            .toList();
      }

      _apiResponse = ApiResponse.complete(_buses);
      if (buses.length <= 0)
        _apiResponse = ApiResponse.error("No buses for now");
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    print(_buses.length);
    notifyListeners();
  }
}
