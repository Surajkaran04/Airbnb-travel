import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'infrastructure/local/app_translations.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Directionality(textDirection: TextDirection.ltr,
            child: GetMaterialApp(
              initialRoute: Routes.splash,
              getPages: AppPages.pageList,
              debugShowCheckedModeBanner: false,
              theme: themeData,
              builder: (context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                  data: data.copyWith(textScaleFactor: 1.1),
                  child: child!,
                );
              },


              supportedLocales: AppTranslations.locales,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: AppTranslations.locale,
              fallbackLocale: AppTranslations.fallbackLocale,
              translations: AppTranslations(),
            ));
      },
    );
  }
}
