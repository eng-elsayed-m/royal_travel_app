import 'package:royal_travel/model/bus/bus.dart';
import 'package:royal_travel/model/bus/buses_service.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BusesRepository {
  final BusesService _busesService = BusesService();
  // List<Bus> _buses = [];
  Future<List<Bus>> fetchBusesData([PickerDateRange? range]) async {
    List<Bus> busesList = await _busesService.getBusesResponse();
    busesList.sort((a, b) => a.upTime!.compareTo(b.upTime!));

    return busesList;
  }
}
