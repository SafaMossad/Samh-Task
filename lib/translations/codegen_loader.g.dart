// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "bookYourFlight": "حجز الرحلة",
  "roundTrip": "الرحلة ذهاب وعوده",
  "oneWay": "رحلة واحدة",
  "multiCity": "متعدد البلدان",
  "from": "من",
  "to": "إلى",
  "departureDate": "تاريخ الوصول",
  "returnDate": "تاريخ العودة",
  "adults": "البالغين",
  "date": "تاريخ",
  "required": "مطلوب",
  "travellers": "المسافرون",
  "travelClass": "الفئة",
  "searchFlights": "بحث عن الرحلات",
  "viewMore": "عرض المزيد",
  "depart": "المغادرة",
  "arrive": "وصول",
  "h": "س",
  "m": "م",
  "flightsAvailable": "الرحلات المتوفرة",
  "searchResult": "نتيجة البحث",
  "home": "الرئيسية",
  "Search": "بحث"
};
static const Map<String,dynamic> en = {
  "bookYourFlight": "Book Your \nFlight",
  "roundTrip": "Round Trip",
  "oneWay": "One Way",
  "multiCity": "Multi City",
  "from": "From",
  "to": "To",
  "departureDate": "Departure Date",
  "returnDate": "Return Date",
  "adults": "Adults",
  "date": "Date",
  "required": "Required",
  "travellers": "Travellers",
  "travelClass": "Class",
  "searchFlights": "Search Flights",
  "viewMore": "View More",
  "depart": "Depart",
  "arrive": "Arrive",
  "h": "H",
  "m": "M",
  "flightsAvailable": "Flights Available",
  "searchResult": "Search Result",
  "home": "Home",
  "Search": "Search"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
