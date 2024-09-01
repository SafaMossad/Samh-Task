import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'presentation/Pages/booking_details/view_model/booking_details_form_view_model.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookingDetailsViewModel()),
      ],
      child: child,
    );
  }
}
