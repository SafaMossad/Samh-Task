import 'package:flutter/material.dart';

class BookingDetailsViewModel extends ChangeNotifier {
  BookingDetailsViewModel();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> _travelerType = ['1 Adult', '2 Adult', '3 Adult'];
  List<String> get travelerType => _travelerType;

  List<String> _ticketClass = ['Economy', 'Business',"First"];
  List<String> get ticketClass => _ticketClass;
}
