import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../component/custom_assets_image.dart';
import '../../../component/custom_text.dart';

class TripTecketFirstRowWidget extends StatelessWidget {
  const TripTecketFirstRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Indego",
          textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.primary, fontWeight: FontWeightManager.bold),
        ),
        const CustomAssetsImage(image: AssetsManager.travelingCompanyLogo),
        CustomText(
          text: "\$80",
          textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorManager.orangeColor,
              fontSize: 18,
              fontWeight: FontWeightManager.bold),
        ),
      ],
    );
  }
}
