import 'package:royal_travel/model/booking/ticket.dart';

class BookingService {
  Ticket? _ticket;
  Future<Ticket?> getBookingData() async {
    await Future.delayed(Duration(seconds: 2));
    return _ticket;
  }

  Future<void> uploadTicket(Ticket ticket) async {
    await Future.delayed(Duration(seconds: 2));
    print("Ticket Added");
    _ticket = ticket;
  }

  Future<void> cancleBooking(int index) async {
    await Future.delayed(Duration(seconds: 2));
    _ticket = null;
    print("Ticket Removed");
  }
}
