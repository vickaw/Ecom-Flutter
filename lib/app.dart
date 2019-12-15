import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_shop/generated/i18n.dart';
import 'router.dart' as router;
import 'theme.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: router.splashViewRoute,
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: i18n.supportedLocales,
      localeResolutionCallback: i18n.resolution(
        fallback: new Locale("en", "US"),
      ),
    );
  }
}
