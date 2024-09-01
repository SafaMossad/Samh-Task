import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:samh_project/config/navigation/navigation_services.dart';
import 'package:samh_project/providers.dart';
import 'package:samh_project/translations/codegen_loader.g.dart';

import 'config/navigation/route_generator.dart';
import 'config/navigation/routes.dart';
import 'config/themes/theme_manager.dart';
import 'core/utils/constants.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(AppProviders(
    child: EasyLocalization(
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar', 'EG'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: Constants.appName,
          theme: getApplicationTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.customNavBarPage,
          navigatorKey: NavigationService.navigationKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
        );
      },
    );
  }
}
