import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_project/presentation/component/tap_effect.dart';

import '../../../../core/resources/resources.dart';
import '../../../../translations/local_keys.g.dart';
import '../../../component/custom_assets_image.dart';
import '../../../component/custom_text.dart';

class FlightBookingHeaderWidget extends StatelessWidget {
  final String from;
  final String to;
  const FlightBookingHeaderWidget({
    required this.from,
    required this.to,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomAssetsImage(
          image: AssetsManager.searchResultHeader,
          boxFit: BoxFit.fill,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TapEffect(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: translate(LocaleKeys.searchResult),
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeightManager.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 70.w, left: 70.w, top: 150.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(
              text: from,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeightManager.bold),
            ),
            CustomText(
              text: to,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeightManager.bold),
            ),
          ]),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Center(
              child: CustomText(
                text: "24 ${translate(LocaleKeys.flightsAvailable)}",
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white, fontWeight: FontWeightManager.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
