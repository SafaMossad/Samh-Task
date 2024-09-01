import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_project/presentation/Pages/flight_trips_booking/widgets/trip_widget_second_row_widget.dart';

import '../../../../translations/local_keys.g.dart';
import '../../../component/custom_text.dart';
import 'custom_circle_for_card_side_curve_widget.dart';
import 'trip_tiecket_first_row_widget.dart';

class TripCardWidget extends StatelessWidget {
  const TripCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          padding: const EdgeInsets.only(
              left: 35.0, right: 35.0, top: 40.0, bottom: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              const TripTecketFirstRowWidget(),
              const Spacer(),
              const TripWidgetSecondRowWidget(),
              const Spacer(),
              CustomText(
                text: translate(LocaleKeys.viewMore),
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
        const CustomCircleForCardSideCurveWidget(
          isRight: false,
        ),
        const CustomCircleForCardSideCurveWidget(
          isRight: true,
        ),
      ],
    );
  }
}
