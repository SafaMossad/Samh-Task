import 'package:flutter/material.dart';

import '../../presentation/Pages/booking_details/pages/booking_details_form_page.dart';
import '../../presentation/Pages/bottom_nav_bar/buttom_nav_bar.dart';
import '../../presentation/Pages/flight_trips_booking/pages/flight_booking_page.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.customNavBarPage:
        return platformPageRoute(const CustomNavBarPage());
      case Routes.flightBookingPage:
        final args = settings.arguments as Map<String, dynamic>;

        return platformPageRoute(FlightBookingPage(
          from: args['from'],
          to: args['to'],
        ));

      /*    case Routes.quickOrderAddNewCarForm:
        final args = settings.arguments as Map<String, dynamic>;

        return platformPageRoute(QuickOrderAddNewCarForm(
          masterServiceId: args['masterServiceId'],
          customer: args['customer'],
        )); */

      default:
        return platformPageRoute(const BookingDetailsFormScreen());
    }
  }
}
