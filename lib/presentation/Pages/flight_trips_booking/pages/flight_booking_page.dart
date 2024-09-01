import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_project/presentation/component/spaces.dart';

import '../widgets/flight_booking_header_widget.dart';
import '../widgets/trip_card_widget.dart';

class FlightBookingPage extends StatelessWidget {
  final String from;
  final String to;
  const FlightBookingPage({
    super.key,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: Column(children: [
        FlightBookingHeaderWidget(
          from: from,
          to: to,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const TripCardWidget();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return VerticalSpace(15.h);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
