import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_project/presentation/component/button_indicator.dart';
import 'package:samh_project/presentation/component/custom_assets_image.dart';
import 'package:samh_project/presentation/component/custom_text.dart';
import 'package:samh_project/presentation/component/spaces.dart';
import 'package:samh_project/presentation/component/tap_effect.dart';


import '../../core/resources/resources.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final String? assetsIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final MainAxisAlignment? buttonAlignment;
  final bool withBorder;
  final bool loading;
  final TextStyle? textStyle;
  final bool fullWidth = false;
  final bool shadow = false;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final BorderRadius? radius;
  final VoidCallback? onTap;

  const CustomButton(
      {super.key,
      this.text,
      this.assetsIcon,
      this.width,
      this.withBorder = false,
      this.height,
      this.buttonAlignment,
      this.radius,
      this.textStyle,
      this.borderColor,
      this.padding,
      this.margin,
      this.loading = false,
      this.backgroundColor,
      this.textColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      isClickable: !loading,
      onTap: loading ? null : onTap,
      child: Container(
        height: height ?? 50.h,
        width: width,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 5.w),
        margin: margin,
        decoration: BoxDecoration(
          border: withBorder
              ? Border.all(
                  color: borderColor ??
                      backgroundColor ??
                      Theme.of(context).primaryColor)
              : null,
          /*       boxShadow: const [
            BoxShadow(
                color: ColorManager.greyColor,
                spreadRadius: 1,
                blurRadius: 5), // changes position of shadow
          ],*/
          color: backgroundColor ?? ColorManager.primary,
          // gradient: backgroundColor == null ? getMainColorGradient() : null,
          borderRadius: radius ??
              BorderRadius.all(
                Radius.circular(8.r),
              ),
        ),
        child: Center(
            child: loading
                ? const ButtonProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      assetsIcon != null
                          ? Padding(
                              padding: EdgeInsets.all(8.w),
                              child: CustomAssetsImage(
                                  height: 20.h, image: assetsIcon!),
                            )
                          : const SizedBox(),
                      assetsIcon != null
                          ? const HorizontalSpace(20)
                          : const SizedBox(),
                      assetsIcon != null
                          ? Expanded(
                              child: CustomText(
                                textStyle: textStyle ??
                                    Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: textColor ?? Colors.white,
                                            fontWeight:
                                                FontWeightManager.semiBold,
                                            height: 1),
                                textAlign: TextAlign.start,
                                /*     maxLines: 1,
                          overflow: TextOverflow.ellipsis,*/
                                text: text ?? "",
                              ),
                            )
                          : CustomText(
                              textStyle: textStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: textColor ?? Colors.white,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          height: 1),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: text ?? "",
                            ),
                      //  assetsIcon != null? const Spacer() :const SizedBox(),
                      assetsIcon != null
                          ? Icon(
                              Icons.arrow_forward_ios,
                              color: ColorManager.white,
                              size: 20.h,
                            )
                          : const SizedBox(),
                    ],
                  )),
      ),
    );
  }
}
