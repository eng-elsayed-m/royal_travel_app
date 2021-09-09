import 'package:flutter/cupertino.dart';
import 'package:royal_travel/model/booking/booking_repository.dart';
import 'package:royal_travel/model/booking/ticket.dart';
import 'package:royal_travel/notification_helper.dart';

class BookingModelView extends ChangeNotifier {
  final BookinRepository bookingRepo = BookinRepository();
  Ticket? _ticket;
  Ticket? get ticket => _ticket;
  Future<void> fetchTickets() async {
    _ticket = await bookingRepo.getTickets();
    notifyListeners();
  }

  Future<void> addTicket(
      {Ticket? tic,
      Function? onDidReceiveLocalNotification,
      Function? selectNotification}) async {
    print("here");
    final noticHelper = NotificationHelper();
    print("here");
    await bookingRepo.createTicket(tic!);
    await fetchTickets();

    noticHelper.showNotification(0, "Ticket Added", "Need payment confirm !");
  }

  Future<void> cancleTicket(int index) async {
    _ticket = null;
    // await BookinRepository().deleteTicket(index);
    notifyListeners();
  }
}
