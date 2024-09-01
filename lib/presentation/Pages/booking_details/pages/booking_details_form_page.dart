import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:samh_project/config/navigation/navigation.dart';
import 'package:samh_project/core/resources/resources.dart';
import 'package:samh_project/presentation/component/custom_button.dart';
import 'package:samh_project/presentation/component/custom_text_field.dart';
import 'package:samh_project/translations/local_keys.g.dart';

import '../../../../core/resources/styles_manager.dart';
import '../../../component/custom_assets_image.dart';
import '../../../component/custom_text.dart';
import '../../../component/spaces.dart';
import '../view_model/booking_details_form_view_model.dart';

class BookingDetailsFormScreen extends StatefulWidget {
  const BookingDetailsFormScreen({super.key});

  @override
  State<BookingDetailsFormScreen> createState() =>
      _BookingDetailsFormScreenState();
}

class _BookingDetailsFormScreenState extends State<BookingDetailsFormScreen> {
  TextEditingController _dateRangeController = TextEditingController();
  final TextEditingController _fromController =
      TextEditingController(text: 'Riyadh');
  final TextEditingController _toController =
      TextEditingController(text: 'London');
  String? _selectedTravelers;
  String? _selectedTicketClass;

  void _exchangeLocations() {
    // Swap the text between the two text fields
    String temp = _fromController.text;
    _fromController.text = _toController.text;
    _toController.text = temp;
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorManager.primary,
              onPrimary: Colors.white,
              onSurface: ColorManager.primary,
            ),
            dialogBackgroundColor: ColorManager.primary,
          ),
          child: child!,
        );
      },
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 7)),
      ),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        // Format the start and end dates
        final DateFormat formatter = DateFormat('d, MMM y');
        final String formattedStartDate = formatter.format(picked.start);
        final String formattedEndDate = formatter.format(picked.end);
        _dateRangeController.text = '$formattedStartDate - $formattedEndDate';
      });
    }
  }

  @override
  void dispose() {
    _dateRangeController.dispose();
    _fromController.dispose();
    _toController.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void handleClick(String value) {
    switch (value) {
      case 'Arabic':
        {
          context.setLocale(const Locale("ar"));
        }
        break;
      case 'English':
        {
          context.setLocale(const Locale("en"));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookingDetailsViewModel = context.watch<BookingDetailsViewModel>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF4F4F4),
        body: Stack(alignment: Alignment.topCenter, children: [
          const CustomAssetsImage(
            image: AssetsManager.bookingHeader,
            boxFit: BoxFit.fill,
            width: double.infinity,
            //height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100.0),
                  CustomText(
                    text: translate(LocaleKeys.bookYourFlight),
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        height: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    dividerHeight: 1,
                    tabAlignment: TabAlignment.start,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1.0, color: Colors.white),
                      insets: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
                    ),
                    indicatorColor: Colors.white,
                    indicatorWeight: 0,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white70,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(fontSize: 16),
                    onTap: (index) {
                      //   print('Tab index: $index');
                    },
                    tabs: [
                      Tab(text: translate(LocaleKeys.roundTrip)),
                      Tab(text: translate(LocaleKeys.oneWay)),
                      Tab(text: translate(LocaleKeys.multiCity)),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              fromAndToWidget(),
                              const VerticalSpace(20.0),
                              CustomTextField(
                                controller: _dateRangeController,
                                hintText: translate(LocaleKeys.date),
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return translate(LocaleKeys.required);
                                  }
                                  return null;
                                },
                                readOnly: true,
                                onTap: () => _selectDateRange(context),
                              ),
                              const VerticalSpace(20.0),
                              travelinngPersonsAndClassWidget(
                                  bookingDetailsViewModel),
                              const VerticalSpace(20),
                              CustomButton(
                                text: translate(LocaleKeys.searchFlights),
                                textColor: ColorManager.white,
                                backgroundColor: ColorManager.orangeColor,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  if (!_key.currentState!.validate()) {
                                    debugPrint("Form Not Valid");

                                    return;
                                  }
                                  _key.currentState!.save();
                                  NavigationService.push(
                                      context, Routes.flightBookingPage,
                                      arguments: {
                                        'from': _fromController.text,
                                        'to': _toController.text
                                      });
                                },
                              ),
                              const VerticalSpace(30),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            top: 40.h,
            child: PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'English', 'Arabic'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              child: const Icon(
                Icons.language,
                color: ColorManager.white,
                size: 50,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Stack fromAndToWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          children: [
            Column(
              children: [
                CustomTextField(
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return translate(LocaleKeys.required);
                    }
                    return null;
                  },
                  controller: _fromController,
                  hintText: translate(LocaleKeys.from),
                  prefixIcon: Icon(
                    Icons.circle,
                    color: ColorManager.primary,
                    size: 10.w,
                  ),
                ),
                const VerticalSpace(25),
                CustomTextField(
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return translate(LocaleKeys.required);
                    }
                    return null;
                  },
                  controller: _toController,
                  hintText: translate(LocaleKeys.to),
                  prefixIcon: Icon(
                    Icons.airplanemode_on_rounded,
                    color: ColorManager.primary,
                    size: 20.w,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20.w, right: 22.w, top: 35.h),
              height: 100.h,
              child: const DottedLine(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 8.0,
                dashColor: ColorManager.orangeColor,
                dashRadius: 0.0,
                dashGapLength: 2.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            )
          ],
        ),
        Positioned(
          top: 37,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: ColorManager.primary),
                // borderRadius: BorderRadius.circular(10),
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.swap_vert_rounded,
                  color: ColorManager.primary),
              onPressed: _exchangeLocations,
            ),
          ),
        ),
      ],
    );
  }

  Row travelinngPersonsAndClassWidget(
      BookingDetailsViewModel bookingDetailsViewModel) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField(
            style: textFieldTextStyle(),
            items: bookingDetailsViewModel.travelerType
                .map<DropdownMenuItem<String>>((String? value) {
              return DropdownMenuItem<String>(
                value: value!.toString(),
                child: CustomText(text: value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedTravelers = value.toString();
              });
            },
            validator: (value) {
              if (value == null) {
                return translate(LocaleKeys.required);
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: translate(LocaleKeys.travellers),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: DropdownButtonFormField(
            style: textFieldTextStyle(),
            items: bookingDetailsViewModel.ticketClass
                .map<DropdownMenuItem<String>>((String? value) {
              return DropdownMenuItem<String>(
                value: value!.toString(),
                child: CustomText(text: value),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return translate(LocaleKeys.required);
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _selectedTicketClass = value.toString();
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: translate(LocaleKeys.travelClass),
            ),
          ),
        ),
      ],
    );
  }
}
