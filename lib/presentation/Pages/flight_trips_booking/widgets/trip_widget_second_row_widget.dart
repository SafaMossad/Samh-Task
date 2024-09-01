import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../translations/local_keys.g.dart';
import '../../../component/custom_text.dart';
import 'dashed_line_widget.dart';
import 'tripe_duration_widget.dart';

class TripWidgetSecondRowWidget extends StatelessWidget {
  const TripWidgetSecondRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TripeDurationWidget(
          text: translate(LocaleKeys.depart),
          time: "10:30",
        ),
        Row(
          children: [
            const DashedLineWidget(),
            DottedBorder(
              borderType: BorderType.RRect,
              color: Colors.grey,
              strokeWidth: 1,
              radius: const Radius.circular(50),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(50)),
                  child: CustomText(
                    text:
                        "2${translate(LocaleKeys.h)}, 15${translate(LocaleKeys.m)}",
                    textStyle: const TextStyle(color: Colors.grey),
                  )),
            ),
            const DashedLineWidget(),
          ],
        ),
        TripeDurationWidget(
          text: translate(LocaleKeys.arrive),
          time: "5:30",
        ),
      ],
    );
  }
}
