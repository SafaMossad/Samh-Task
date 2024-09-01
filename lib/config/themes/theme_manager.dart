import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/resources.dart';
import '../../core/resources/styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,

    canvasColor: ColorManager.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: FontFamilyManager.manropeFontFamily,
    iconTheme: IconThemeData(
      color: ColorManager.primary,
      size: 30.w,
    ),
    useMaterial3: true,

    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: ColorManager.primary,
        cursorColor: ColorManager.primary,
        selectionHandleColor: ColorManager.primary),
    expansionTileTheme:
        const ExpansionTileThemeData(iconColor: ColorManager.primary),
    //splashColor: ColorManager.w,
    // ripple effect color
    // card pages theme

    cardTheme: const CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.black,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: ColorManager.primary,
          size: 25.w,
        ),
        centerTitle: false,
        color: ColorManager.primary,
        elevation: 0,
        shadowColor: ColorManager.black,
        titleTextStyle: getBoldStyle(
          fontSize: FontSize.s22,
          color: ColorManager.black,
        )),
    dialogTheme: const DialogTheme(backgroundColor: ColorManager.white),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      hourMinuteTextColor: ColorManager.lightBlack,
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: ColorManager.primary,
        ),
      ),
      dayPeriodTextColor: Colors.black,
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black),
      ),
      dialHandColor: ColorManager.primary,
      dialBackgroundColor: ColorManager.primary,
      entryModeIconColor: ColorManager.lightBlack,
      hourMinuteTextStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodColor: ColorManager.primary,
      hourMinuteColor: ColorManager.primary,
      helpTextStyle: const TextStyle(color: Colors.black),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        // disabledColor: ColorManager.black1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.black),
    indicatorColor: ColorManager.primary,

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            //primary: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),
    tabBarTheme: const TabBarTheme(
      dividerColor: ColorManager.white,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    dividerColor: ColorManager.black,
    dividerTheme: const DividerThemeData(
      color: ColorManager.black,
    ),
    textTheme: TextTheme(
      //As the largest text on the screen, display styles are reserved for short,
      // important text or numerals. They work best on large screens.
      displayLarge: getLightStyle(
        color: ColorManager.black,
        fontSize: FontSize.s22,
      ),
      //Extremely large text.
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s20,
      ),
      headlineMedium: getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
      //text
      //Titles are smaller than headline styles and should be used for shorter, medium-emphasis text.
      titleLarge: getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      titleSmall: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s14,
      ),
      //label
      //Used for text on ElevatedButton, TextButton and OutlinedButton.
      //Label styles are smaller, utilitarian styles, used for areas of the UI such as text inside of components
      // or very small supporting text in the content body, like captions.
      labelLarge: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s14,
      ),
      labelMedium: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s12,
      ),
      labelSmall: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s11,
      ),
      //body
      // Body styles are used for longer passages of text.
      bodyLarge: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      bodyMedium: getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.black,
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        iconColor: ColorManager.primary,
        // content padding
        // hint style

        hintStyle: getRegularStyle(
            color: ColorManager.lightBlack, fontSize: FontSize.s17),
        labelStyle: getMediumStyle(
            color: ColorManager.lightBlack, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: Colors.red),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.greyColor, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
