import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../component/custom_text.dart';

class TripeDurationWidget extends StatelessWidget {
  final String text;
  final String time;
  const TripeDurationWidget({
    required this.text,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.grey, fontWeight: FontWeightManager.medium),
        ),
        CustomText(
          text: time,
          textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorManager.primary, fontWeight: FontWeightManager.bold),
        ),
      ],
    );
  }
}
