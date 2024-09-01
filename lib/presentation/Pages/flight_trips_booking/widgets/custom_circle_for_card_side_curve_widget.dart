import 'package:flutter/material.dart';

class CustomCircleForCardSideCurveWidget extends StatelessWidget {
  final bool isRight;
  const CustomCircleForCardSideCurveWidget({
    required this.isRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: isRight ? null : 0,
      right: isRight ? 0 : null,
      bottom: 70,
      child: const CircleAvatar(
        radius: 15, // Size of the left circle
        backgroundColor: Color(0xffF4F4F4),
      ),
    );
  }
}
