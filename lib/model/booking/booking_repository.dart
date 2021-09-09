import 'package:royal_travel/model/booking/booking_service.dart';
import 'package:royal_travel/model/booking/ticket.dart';

class BookinRepository {
  final _bookingServices = BookingService();
  Future<Ticket?> getTickets() async {
    Ticket? tickets;
    tickets = await _bookingServices.getBookingData();
    return tickets;
  }

  Future<void> createTicket(Ticket ticket) async {
    await _bookingServices.uploadTicket(ticket);
  }

  Future<void> deleteTicket(int index) async {
    await _bookingServices.cancleBooking(index);
  }
}
