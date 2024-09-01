import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samh_project/core/resources/app_colors.dart';
import 'package:samh_project/presentation/component/custom_text.dart';
import 'package:samh_project/presentation/component/tap_effect.dart';
import 'package:samh_project/translations/local_keys.g.dart';

import '../booking_details/pages/booking_details_form_page.dart';

class CustomNavBarPage extends StatefulWidget {
  const CustomNavBarPage({super.key});

  @override
  State<CustomNavBarPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<CustomNavBarPage> {
  Widget _currentWidget = const BookingDetailsFormScreen();

  void _selectWidget(Widget widget) {
    setState(() {
      _currentWidget = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: ColorManager.primary,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 75.h,
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TapEffect(
                onTap: () {
                  setState(() {
                    _selectWidget(
                      const Center(
                        child: Text('Home Is Under Development'),
                      ),
                    );
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.home, color: Colors.white),
                    CustomText(
                        text: translate(LocaleKeys.home),
                        textStyle: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              TapEffect(
                onTap: () {
                  setState(() {
                    _selectWidget(
                      const Center(
                        child: Text('Search Is Under Development'),
                      ),
                    );
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.search, color: Colors.white),
                    CustomText(
                        text: translate(LocaleKeys.Search),
                        textStyle: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: _currentWidget,
      floatingActionButton: SizedBox(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            onPressed: () {
              setState(() {
                _currentWidget = const BookingDetailsFormScreen();
              });
            },
            child: const Icon(
              Icons.flight_takeoff_outlined,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }
}
