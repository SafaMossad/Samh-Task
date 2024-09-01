import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DashedLineWidget extends StatelessWidget {
  const DashedLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.grey,
        dashRadius: 0.0,
        dashGapLength: 1.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
